require "spec_helper"

feature "User enters data about the current day" do 

  scenario "and sees the result in their dashboard" do 
    user = create(:user, confirmed_at: 1.day.ago)
    sign_in user

    select "Day", from: "time_period_select"    
    select "Mood Entry", from: "tracker_type"

    expect(page).to have_content("Energy Level")
    fill_in "energy_level", with: 8
    fill_in "previous_nights_sleep", with: 7
    fill_in "alcoholic_drinks", with: 0
    fill_in "extra_information", with: "a bit of extra info"
    click_on "Submit Entry"
  end

end