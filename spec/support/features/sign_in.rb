module Features
  def sign_in(user)
    visit root_path
    find('a[data-role="signin"]').click
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_on "form_sign_in"
  end
end