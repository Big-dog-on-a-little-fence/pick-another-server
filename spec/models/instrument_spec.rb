require 'rails_helper'

RSpec.describe Instrument, type: :model do
  before(:all) do
    @user1 = create(:unique_user)
    @instrument1 = create(:mandolin, user: @user1)
  end
  
  it "is valid with valid attributes" do
    expect(@instrument1).to be_valid
  end
  
  it "belongs to user" do
    expect(@user1.instruments.first).to eq(@instrument1)
  end
end
