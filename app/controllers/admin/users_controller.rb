class Admin::UsersController < ApplicationController
  
  before_filter :authenticate_user!

  def index
    @users = User.find(:all)
  end

  def new
    @user = User.new

    render 'devise/registrations/new', :locals => {:resource => @user, :resource_name => 'user' }
  end

  def create
    @user = User.new(params[:user])

    if @user.save!
      redirect_to new_user_session_path
    else
      render 'devise/registrations/new', :locals => {:resource => @user, :resource_name => 'user' }
    end
  end
end
