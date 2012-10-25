module MeetingsHelper

  def is_involved(id)
    current_player.meetings.find_by_id(id)
  end

  def list_unique_cities
    Place.select(:city).collect{ |element| "#{element.city}"}.uniq
  end

  def formatted_time_for_header(meeting)
    <<-letsroll
      #{l(meeting.start_at, :format => :date)}
      #{t(:from)}
      #{l(meeting.start_at, :format => :time)}
      #{t(:till)}
      #{l(meeting.end_at, :format => :time)}
    letsroll
  end

  def i18n_downcase(str)
   UnicodeUtils.downcase(str)
  end
end
