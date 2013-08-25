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

require 'spec_helper'

describe Period do
  context "virtual attributes" do 

    describe "period_preset_range" do
      
      it "maps to a set of constants" do
        invalid_presets = %[foo bar baaaaaaaaz raquan] 
        invalid_presets.each do |preset|
          expect(TimePeriod.new(period_preset_range: preset)).not_to be_valid
        end
        Period::PRESETS.each do |preset|
          expect(TimePeriod.new(period_preset_range: preset)).to be_valid
        end
      end 

      it "sets the start time and end time depending on user preferences" do
        user = create(:user, time_zone: 'MST', start_of_day: 5)
        period = Period.new(period_preset_range: "Day", user: user)

         
      end
      
       
    end

  end
end
