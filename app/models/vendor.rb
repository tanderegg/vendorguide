class Vendor < ActiveRecord::Base
  has_many :reviews
  belongs_to :user

  validates_presence_of :name
  validates_presence_of :description

  def rating
    (reviews.average(:score) || "None").to_s
  end

  def get_rating_class
    average_score = reviews.average(:score)

    if(average_score.nil?)
      return ''
    end

    case (average_score / 0.5)
      when 0.0 then
        return ''
      when 1.0 then
        return 'half_star'
      when 2.0 then
        return 'one_star'
      when 3.0 then
        return 'one_and_a_half_stars'
      when 4.0 then
        return 'two_stars'
      when 5.0 then
        return 'two_and_a_half_stars'
      when 6.0 then
        return 'three_stars'
      when 7.0 then
        return 'three_and_a_half_stars'
      when 8.0 then
        return 'four_stars'
      when 9.0 then
        return 'four_and_a_half_stars'
      when 10.0 then
        return 'five_stars'
    end
  end

  def tags
    tags = ['Voter File', 'Analytics', 'Data Warehousing']
    tags.join(', ')
  end
end
