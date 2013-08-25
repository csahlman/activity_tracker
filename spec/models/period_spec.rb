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
         
      end 
      
       
    end

  end
end
