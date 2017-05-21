class CalendarItem < ApplicationRecord
  validates :title, presence: true	
  validates_presence of :start_time, :end_time
  
  def all_day_event?
    self.start == self.start_time.midnight && self.end_time == self.end_time.midnight ? true : false
  end
end
