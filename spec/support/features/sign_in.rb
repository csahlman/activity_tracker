module Features
  def sign_in(user)
    visit root_path
    find('a[data-role="login"]').click
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on "login_link"
  end
end