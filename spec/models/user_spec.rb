# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  email              :string(255)
#  password_digest    :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  remember_password  :boolean          default(FALSE)
#  confirmation_token :string(255)
#  confirmed_at       :datetime
#

require 'spec_helper'

describe User do
  
  context "methods" do 
    describe "confirmed?" do
      
      it "returns false for nil values of confirmed_at" do
        user = create(:user, confirmed_at: nil)
        expect(user.confirmed?).to be_false
      end     

      it "returns true for all non nil values" do
        user = create(:user, confirmed_at: nil)   
        [Time.now, 2.hours.ago, 5.hours.from_now].each do |value|
          user.update_attribute(:confirmed_at, value)
          expect(user.confirmed?).to be_true
        end
      end 

    end    
  end

end
