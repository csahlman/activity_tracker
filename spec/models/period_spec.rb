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

  context "validations " do 
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:end_time) }
    it { should validate_presence_of(:user) }

    it "ensures that end_time > start_time " do
      user = build_stubbed(:user)
      expect(Period.new(start_time: Time.now, end_time: 1.minute.ago, user: user)).not_to be_valid 
      expect(Period.new(start_time: Time.now, end_time: Time.now, user: user)).not_to be_valid 
    end
  end

  context "virtual attributes" do 

    describe "period_type" do
      
      it "maps to a set of constants" do
        user = build_stubbed(:user)
        invalid_presets = %w[foo bar baaaaaaaaz raquan] 
        invalid_presets.each do |preset|
          expect(user.periods.new(period_type: preset, user: user)).not_to be_valid
        end
        Period::PRESETS.each do |preset|
          expect(user.periods.new(period_type: preset, user: user)).to be_valid
        end
      end 

      describe "setting the start time and end time depending on user preferences" do
        
        it "sets the day period for the day before if the current time is less than user's start_of_day" do
          user = create(:user, time_zone: 'EST', start_of_day: 5, period_preference: 'Day')
          earlier_today = DateTime.now.in_time_zone(user.time_zone).beginning_of_day
          Timecop.freeze(earlier_today.to_s)

          period = Period.create(period_type: "Day", user: user)

          expect(period.start_time).to eq Date.yesterday
        end

        it "sets the current day if the current time is greater than or equal to start_of_day" do
          user = create(:user, time_zone: 'EST', start_of_day: 5, period_preference: 'Day')
          later_today = DateTime.now.in_time_zone(user.time_zone).end_of_day
          Timecop.freeze(later_today.to_s)
          
          period = Period.create(period_type: "Day", user: user)

          expect(period.start_time).to eq Date.today
        end

        it "sets the hour of the day equal to the start_of_day of user if present, otherwise 5" do
          user = create(:user, time_zone: 'EST', start_of_day: 5, period_preference: 'Day')
          later_today = DateTime.now.in_time_zone(user.time_zone).end_of_day.change( { hour: 3 })
          Timecop.freeze(later_today.to_s)

          period = Period.create(period_type: "Day", user: user)

          expect(period.start_time.to_s.strf_time("%H")).to eq(5)

          later_today = DateTime.now.in_time_zone(user.time_zone).end_of_day.change( { hour: 20 })
          Timecop.freeze(later_today.to_s)

          period = Period.create(period_type: "Day", user: user)
        end

        
      end
      
       
    end

  end
end
