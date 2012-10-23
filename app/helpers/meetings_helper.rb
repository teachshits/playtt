module MeetingsHelper
  def is_involved(id)
    current_player.meetings.find_by_id(id)
  end

  def list_unique_cities
    Place.select(:city).collect{ |element| "#{element.city}"}.uniq
  end
end
