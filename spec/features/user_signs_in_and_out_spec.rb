require "spec_helper"

feature "User signs in and out" do 

  scenario "without confirming their account" do 
    user = create(:user, confirmed_at: nil)

    visit root_path

    find('a[data-role="signin"]').click
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_on "form_sign_in"

    expect(page).to have_css('.error', text: 
      "Account not confirmed, please click below to resend instructions")
    expect(page).not_to have_css('a', text: "Sign Out")
  end

  scenario "after confirming their account" do 
    user = create(:user, confirmed_at: 1.day.ago)

    visit root_path

    find('a[data-role="signin"]').click
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_on "form_sign_in"

    expect(page).to have_css('.success', text: "Successfully signed in")

    click_on "Sign Out"
    expect(page).to have_css('.success', text: "Signed Out")
  end

end