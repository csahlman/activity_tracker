# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)
#  password_digest        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  remember_password      :boolean          default(FALSE)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  password_reset_sent_at :datetime
#  password_reset_token   :string(255)
#  username               :string(255)
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

    describe "valid_for_password_reset?" do

      it "returns true with a nil value for password_reset_sent_at" do
        user = build_stubbed(:user, password_reset_sent_at: nil)
        expect(user.valid_for_password_reset?).to be_true
      end

      it "returns true with a value sent more than 15 minutes ago" do
        user = build_stubbed(:user, password_reset_token: "foo", password_reset_sent_at: 20.minutes.ago)
        expect(user.valid_for_password_reset?).to be_true 
      end

      it "returns false with a value sent less than 15 minutes ago" do
        user = build_stubbed(:user, password_reset_token: "foo" ,password_reset_sent_at: 10.minutes.ago)
        expect(user.valid_for_password_reset?).to be_false 
      end
      
    end

    describe "create_password_reset" do

      it "sets the password reset token" do
        user = build_stubbed(:user, password_reset_token: nil)
        user.create_password_reset
        expect(user.password_reset_token).to be_present
      end

      it "touches the password_reset_sent_at" do
        user = build_stubbed(:user, password_reset_sent_at: nil)
        user.create_password_reset
        expect(user.password_reset_sent_at).to be_present
      end
      
    end
  end

end
