module ApplicationHelper
  def get_rating_class(score)

    if(score.nil?)
      return ''
    end

    case (score / 0.5)
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
end
