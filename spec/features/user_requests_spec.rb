require 'rails_helper'

RSpec.describe "UserRequests", type: :feature do
  before do 
    6.times do
      create(:user)
    end
    @users = User.where id: 0..5
    login_as User.last
  end
  
  scenario "GET /users" do
    visit '/users'
    @users.each do |user|      
      expect(page).to have_content(user.username)
    end
  end
  
  scenario "GET /user" do
    @users.each do |user|
      visit "/users/#{user.id}"
      expect(page).to have_content(user.username)
    end
  end

  scenario "GET /repertoire" do
    non_user_tune = create(:tune)
    user = create(:user_with_tunes)
    login_as user
    visit repertoire_user_path(user)
    user.tunes.each do |tune|
      expect(page).to have_content(tune.name)
    end
    expect(page).not_to have_content(non_user_tune)
  end

end