require "spec_helper"

feature "User resets their password" do 

  scenario "and creates a new one" do 
    user = create(:user, confirmed_at: Time.now)

    visit root_path

    find('a[data-role="signin"]').click
    click_on "Forgot Your Password?"

    fill_in "Email", with: user.email
    click_on "Reset Password"

    expect(page).to have_css('.success', text: "Password reset, please check your email")

    expect(last_email.to).to eq([user.email])
    user.reload
    visit edit_password_reset_path(token: user.password_reset_token)

    fill_in "Password", with: "AP4ssw0rd"
    fill_in "Password Confirmation", with: "AP4ssw0rd"

    click_on "Update Password"

    expect(page).to have_css('.success', text: "Password Updated")
    expect(page).to have_content("Sign Out")
  end

  scenario "and cannot update without a token" do 
    user = create(:user, confirmed_at: Time.now)

    visit root_path

    find('a[data-role="signin"]').click
    click_on "Forgot Your Password?"

    fill_in "Email", with: user.email
    click_on "Reset Password"

    visit edit_password_reset_path

    fill_in "Password", with: "AP4ssw0rd"
    fill_in "Password Confirmation", with: "AP4ssw0rd"

    click_on "Update Password"

    expect(page).to have_css('.error', text: "Invalid Token")
    expect(page).not_to have_content("Sign Out")

  end

end