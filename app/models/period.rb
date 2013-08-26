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
  belongs_to :user

  PRESETS = %w[Day Week Month Custom]

  validates :period_type, inclusion: { in: PRESETS }

  validates_presence_of :start_time, :end_time, :user

  validate :end_time_greater_than_start_time

  before_validation :set_start_and_end_time


  protected

    def set_start_time(start_of_day, time_zone)
      if DateTime.now.in_time_zone(time_zone) < DateTime.now.in_time_zone(time_zone).change({ hour: start_of_day })
        DateTime.yesterday.in_time_zone(time_zone).change({ hour: start_of_day })
      else
        DateTime.now.in_time_zone(time_zone).change({ hour: start_of_day })
      end
    end

    def set_end_time(start_of_day, time_zone)
      if DateTime.now.in_time_zone(time_zone) < DateTime.now.in_time_zone(time_zone).change({ hour: start_of_day })
        DateTime.now.in_time_zone(time_zone).change({ hour: start_of_day })
      else
        DateTime.tomorrow.in_time_zone(time_zone).change({ hour: start_of_day })
      end
    end

  private

    def set_start_and_end_time
      case period_type
      when "Day"
        self.start_time = set_start_time(user.start_of_day, user.time_zone)
        self.end_time = set_end_time(user.start_of_day, user.time_zone) 
      end
    end

    def end_time_greater_than_start_time
      if start_time.present? && end_time.present?
        errors.add(:start_time, "Must be before end date") unless start_time < end_time 
      end
    end

end
