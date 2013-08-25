# == Schema Information
#
# Table name: periods
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  period_type :string(255)
#  start_time  :datetime
#  end_time    :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

class Period < ActiveRecord::Base
  attr_accessor :period_preset_range

  belongs_to :user

  PRESETS = %w[Day Week Month Custom]

  # validates :period_preset_range, inclusion: { in: PRESETS }

  # validate :end_time_greater_than_start_time

  validates_presence_of :start_time, :end_time


  def period_preset_range=(period)
    unless PRESETS.include?(period)
      errors.add(:period_type, "must be in the list") 
    end
    self.period_type = PRESETS[period]
    self.start_time = set_start_time(user.start_of_day, user.time_zone)
    self.end_time = set_end_time(user.start_of_day, user.time_zone)
    if self.start_time >= self.end_time
      errors.add(:start_time, "must be before end time") 
    end
  end

  def period_preset_range
    
  end

  protected

    def set_start_time(start_of_day, time_zone)
      
    end

    def set_end_time(start_of_day, time_zone)
      
    end

  private

    def end_time_greater_than_start_time
      errors.add(:start_time, "Must be before end date") unless start_time < end_time 
    end

end
