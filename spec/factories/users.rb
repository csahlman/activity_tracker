FactoryGirl.define do
  factory :user do
    # sequence(:username) { |n| "nchabazam"  }  
    sequence(:email) { |n| "foo_#{n}@foo.foo" }
    # age 25
    # receive_emails false
    password "P4ssword"
    password_confirmation "P4ssword"
    confirmed_at 1.hour.ago
    password_reset_token nil
    password_reset_sent_at nil
  end
end
