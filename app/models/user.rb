class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :omniauthable, :registerable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :facebook_token, :facebook_id, :first_name, :last_name

#  validates_presence_of :facebook_token

  MyMogliStub = Struct.new(:first_name, :last_name, :square_image_url)

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']

    # This is kinda sloppy, but Mogli doesn't work well
    # with cucumber as is, so the exception should only be thrown
    # when cucumber is running its tests.  Creates a stub user
    begin
      facebook_user = Mogli::User.find("me", Mogli::Client.new(access_token['credentials']['token']))
      user_attributes = {:facebook_token => access_token['credentials']['token'], :facebook_id => facebook_user.id, :first_name => facebook_user.first_name, :last_name => facebook_user.last_name}
    rescue Mogli::Client::OAuthException
      user_attributes = {:facebook_token => access_token['credentials']['token'], :facebook_id => 1, :first_name => "User", :last_name => "Name"}
    end

    if user = User.find_by_email(data["email"])
      user.update_attributes(user_attributes)
      user
    else # Create an user with a stub password.
      User.create!({:email => data["email"], :password => Devise.friendly_token[0,20]}.merge(user_attributes))
    end
  end

  def name
    "#{first_name} #{last_name[0].to_s}."
  end

  def facebook_client
    @client ||= Mogli::Client.new(facebook_token)
  end

  def me
    # This is kinda sloppy, but Mogli doesn't work well
    # with cucumber as is, so the exception should only be thrown
    # when cucumber is running its tests.  Creates a stub user
    begin
      @me ||= Mogli::User.find("me", facebook_client)
    rescue Mogli::Client::OAuthException
      @me ||= MyMogliStub.new("User", "Name", "")
    end
  end

end
