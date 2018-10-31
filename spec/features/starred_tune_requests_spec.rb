require 'rails_helper'

RSpec.feature "StarredTuneRequests", type: :feature do
  
  before do # add a starred tune
    @tune = create(:tune)
    @user1 = create(:user)
    login_as @user1
    visit "/tunes"
    click_link @tune.name
    click_link_or_button "Add to starred tunes"
    @goal = UserStarredTune::GOALS.sample
    fill_in "user_starred_tune_goal", with: @goal
    click_link_or_button "Add starred tune"
  end
  
  scenario "Add tune to user's starred list" do
    visit "/users/#{@user1.id}"
    expect(page).to have_text(@tune.name)
    expect(page).to have_text(@goal)
  end
  
  scenario "Edit goal of tune in user's starred list" do
    visit "/tunes/#{@tune.id}"
    click_on "Edit goal"
    new_goal = "learn to play with shovel"
    fill_in "user_starred_tune_goal", with: new_goal
    click_link_or_button "Update goal"
    visit "/users/#{@user1.id}"
    expect(page).to have_text(@tune.name)
    expect(page).to have_text(new_goal)
  end

  scenario "Remove tune from user's starred list", js: true do
    visit "/tunes"
    click_link @tune.name
    accept_confirm do
      click_link_or_button "Remove from starred list"
    end
    visit "/users/#{@user1.id}"
    expect(page).not_to have_text(@tune.name)
    expect(page).not_to have_text(@goal)
  end

end
