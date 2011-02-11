class Vendor < ActiveRecord::Base
  has_many :reviews
  belongs_to :user

  validates_presence_of :name
  validates_presence_of :description

  def rating
    (reviews.average(:score) || "None").to_s
  end

  def tags
    tags = ['Voter File', 'Analytics', 'Data Warehousing']
    tags.join(', ')
  end
end
