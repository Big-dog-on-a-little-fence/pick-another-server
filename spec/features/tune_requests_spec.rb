require 'rails_helper'

RSpec.feature "TuneRequests", type: :feature do
  before do 
    5.times do
      create(:tune)
    end
    @user = create(:user)
    @tunes = Tune.all
    login_as @user
  end
  
  scenario "GET /tunes" do
    visit '/tunes'
    @tunes.each do |tune|      
      expect(page).to have_content(tune.name)
    end
  end
  
  scenario "GET /tune" do
    @tunes.each do |tune|
      visit "/tunes/#{tune.id}"
      expect(page).to have_content(tune.name)
      expect(page).to have_content(tune.key)
      expect(page).to have_content(tune.time_signature)
    end
  end
  
  scenario "POST /tune" do
    visit "/tunes"
    click_on "Add tune"
    tune_name = Faker::Lorem.unique.characters(12)
    tune_key = Faker::Music.key
    fill_in "tune_name", with: tune_name
    fill_in "tune_key", with: tune_key
    fill_in "tune_time_signature", with: "4/4"
    click_on "Create Tune"
    expect(page).to have_current_path(tune_path(Tune.last))
    expect(page).to have_content(tune_name)
    expect(page).to have_content(tune_key)
  end

  scenario "EDIT /tune" do
    tune = Tune.all.sample
    visit "/tunes/#{tune.id}"
    click_on "Edit Tune"
    tune_name = Faker::Lorem.unique.characters(12)
    tune_key = Faker::Music.key
    tune_time_signature = "9/8"
    fill_in "tune_name", with: tune_name
    fill_in "tune_key", with: tune_key
    fill_in "tune_time_signature", with: tune_time_signature
    click_on "Update Tune"
    expect(page).to have_current_path(tune_path(tune))
    expect(page).to have_content(tune_name)
    expect(page).to have_content(tune_key)
  end
end
