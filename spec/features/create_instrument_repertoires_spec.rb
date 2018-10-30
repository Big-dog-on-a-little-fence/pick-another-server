require 'rails_helper'

RSpec.feature "CreateInstrumentRepertoires", type: :feature do
  
  scenario "Create user with all instruments and add instrument tunes" do
    50.times do
      create(:tune) 
    end
    @user = create(:user_with_all_instruments)
    login_as @user
    visit "/users/#{@user.id}"
    @user.instruments.each do |instrument|
      expect(page).to have_text(instrument.type)
    end
    count = 1
    @user.instruments.each do |instrument|
      visit "/tunes"
      @tune = Tune.find count
      click_link @tune.name
      click_link_or_button "Add to repertoire"
      check(instrument.type, allow_label_click: true)
      click_link_or_button "Create Repertoire"
      visit "/#{instrument.type.downcase.pluralize}/#{instrument.id}"
      expect(page).to have_text(@tune.name)
      count += 1
    end
  end
  
end
