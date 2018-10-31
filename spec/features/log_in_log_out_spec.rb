require 'rails_helper'

RSpec.feature "LogInLogOut", type: :feature do
  before(:all) do
    @user = create(:user)
  end
  
  scenario "User log in" do
    visit "/users/sign_in"
    fill_in "user_login", :with => @user.username
    fill_in "user_password", :with => @user.password
    click_button "Log in"
    expect(page).to have_text("Signed in successfully.")
  end
  
  scenario "User log out" do
    login_as @user
    visit "/users/#{@user.id}"
    click_link 'Log out'
    expect(page).to have_text("You need to sign in or sign up before continuing.")
  end

end
