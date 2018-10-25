require 'rails_helper'

RSpec.feature "LogInLogOuts", type: :feature do
  before(:all) do
    @user1 = create(:user)
  end
  
  scenario "User sign in" do
    visit "/users/sign_in"
    fill_in "user_login", :with => @user1.username
    fill_in "user_password", :with => @user1.password
    click_button "Log in"
    expect(page).to have_text("Signed in successfully.")
  end
  
  scenario "User log out" do
    login_as @user1
    visit "/users/#{@user1.id}"
    click_link 'Log out'
    expect(page).to have_text("You need to sign in or sign up before continuing.")
  end

end
