class Meeting < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :start_at, :place_id, :end_at, :level, :title
  validates :place_id, :title, :level, :start_at, :end_at, :presence => true
  validate :event_takes_place_in_one_day, :event_date_in_valid_range, :event_is_not_in_the_past, :if => 
    Proc.new {|record| record.start_at.present? and record.end_at.present?}
  #TODO: добавить картинку места
  belongs_to :place
  has_many :participations, :dependent => :destroy
  has_many :players, :through => :participations
  
  scope :in_city, lambda {|city| includes(:place).where(:places => {:city => city}) }
  scope :one_participant, where(:players_count => 1)
  scope :hot, where('start_at BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_month)

private

  def event_takes_place_in_one_day
    if self.start_at.day != self.end_at.day
      errors.add(:meeting, 'must take place in one day')
    end
  end
 
  def event_date_in_valid_range
    admissible_range = DateTime.now.beginning_of_day..DateTime.now.end_of_month
    if !(admissible_range.cover?(self.start_at) && admissible_range.cover?(self.end_at))
      errors.add(:valid_range, 'is only current month')
    end        
  end

  def event_is_not_in_the_past
    today = DateTime.now.beginning_of_day
    if (start_at < today or end_at < today)
      errors.add(:meeting, 'must not be in the past')
    end
  end

end
