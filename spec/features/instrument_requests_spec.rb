require 'rails_helper'

RSpec.feature "InstrumentRequests", type: :feature do
  
  before do
    @user = create(:user)
    login_as @user
  end
  
  scenario "Create instrument" do 
    visit user_path(@user)
    click_on "Add instrument"
    instrument_type = Instrument.type.sample
    select instrument_type, from: 'instrument_type'
    click_on "Add instrument"
    
    expect(page).to have_content(instrument_type)
  end
  
  scenario "Delete instrument" do
    
  end
  
  scenario "Get instrument tunes index" do
    instrument = create(:instrument_with_tunes)
    visit "/#{instrument.type.downcase.pluralize}/#{instrument.id}"
    instrument.tunes.each do |tune|
      expect(page).to have_content(tune.name)
    end
  end
  
end
