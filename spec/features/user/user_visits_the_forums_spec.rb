require "spec_helper"

feature "User Visits the Forums" do 

  scenario "And visits a post" do 
    user = create(:user)
    sign_in user

    click_on "Visit the Forums"

  end

end