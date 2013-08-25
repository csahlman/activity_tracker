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

  def period_preset_range=(period)
        
  end

  def period_preset_range
    
  end

end
