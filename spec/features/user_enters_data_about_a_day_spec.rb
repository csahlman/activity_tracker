require "spec_helper"

feature "User enters data about the current day", js: true do 

  scenario "and sees the result in their dashboard" do 
    user = create(:user, confirmed_at: 1.day.ago, start_of_day: 5)
    sign_in user

    # mid_day = Timecop.freeze(DateTime.now.in_time_zone(user.time_zone).change( { hour: 10 }).to_time)

    select "Day", from: "time_period_select"
    expect(page).to have_content DateTime.now.in_time_zone(user.time_zone).
      change({hour: user.start_of_day}).strftime("%Y-%M-%D")
    expect(page).to have_content DateTime.tomorrow.in_time_zone(user.time_zone).
      change({hour: user.start_of_day}).strftime("%Y-%M-%D") 


    select "Mood Entry", from: "tracker_type"

    expect(page).to have_content("Energy Level")
    fill_in "energy_level", with: 8
    fill_in "previous_nights_sleep", with: 7
    fill_in "alcoholic_drinks", with: 0
    fill_in "extra_information", with: "a bit of extra info"
    click_on "Submit Entry"
  end

end