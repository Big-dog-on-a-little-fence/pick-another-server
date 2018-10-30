require 'rails_helper'

RSpec.feature "AddDeleteRepertoires", type: :feature do
  
  scenario "Add repertoire without instruments to user" do
    @tune = create(:tune)
    @user1 = create(:user)
    login_as @user1
    visit "/tunes"
    click_link @tune.name
    click_link_or_button "Add to repertoire"
    click_link_or_button "Create Repertoire"
    visit "/users/#{@user1.id}"
    expect(page).to have_text(@tune.name)
  end

  scenario "Delete repertoire without instruments from user", js: true do
    @user1 = create(:user_with_tunes)
    tune = @user1.tunes.first
    login_as @user1
    visit "/tunes"
    click_link tune.name
    accept_confirm do
      click_link_or_button "Remove from repertoire"
    end
    visit "/users/#{@user1.id}"
    expect(page).not_to have_text(tune.name)
  end

end
