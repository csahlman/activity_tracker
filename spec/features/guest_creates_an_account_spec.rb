require "spec_helper"


feature "Guest creates an account", js: true do 

  scenario "and verifies their email" do 
    visit root_path

    find('a[data-role="signup"]').click
    fill_in "user_email", with: "charlie@gmail.com"
    fill_in "user_password", with: "P4ssw0rd"
    fill_in "user_password_confirmation", with: "P4ssw0rd"
    check "user_remember_password"

    click_on "Register!"

    expect(page).to have_css('.success', text: "Check your email to finish sign up")
    expect(page).not_to have_content "Sign Out"
    expect(last_email.to).to eq ["charlie@gmail.com"]

    visit account_confirmations_path

    expect(page).to have_css('.error', text: "Invalid confirmation token")

    user = User.find_by_email("charlie@gmail.com")
    
    visit account_confirmations_path(confirmation_token: user.confirmation_token)

    expect(current_path).to eq(root_path)
    expect(page).to have_css('.success', text: "Account confirmed")
    expect(page).to have_css('a', text: "Sign Out")

    click_on "Sign Out"
    expect(page).to have_css('.success', text: "Signed Out")
  end

end