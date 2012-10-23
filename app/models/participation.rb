class Participation < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :meeting_id, :player_id
  validates :meeting_id, :player_id, :presence => true
  belongs_to :player
  belongs_to :meeting, :counter_cache => :players_count
end
