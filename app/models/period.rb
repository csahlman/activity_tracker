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
end
