require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user1 = create(:user)
  end
  
  it "is valid with valid attributes" do
    expect(@user1).to be_valid
  end
  
  it "has a unique username" do
    user2 = build(:user, email: @user1.email)
    expect(user2).to_not be_valid
  end
  
  it "has a unique email" do
    user2 = build(:user, username: @user1.username)
    expect(user2).to_not be_valid
  end
  
  it "is not valid without a password" do 
    user2 = build(:user, password: nil)
    expect(user2).to_not be_valid
  end
  
  it "is not valid without a username" do 
    user2 = build(:user, username: nil)
    expect(user2).to_not be_valid
  end
  
  it "is not valid without an email" do
    user2 = build(:user, email: nil)
    expect(user2).to_not be_valid
  end
  
  it "has correct number of instruments" do
    @instrument1 = create(:mandolin, user: @user1)
    @instrument2 = create(:cello, user: @user1)
    @instrument3 = create(:violin, user: @user1)
    expect(@user1.instruments.count).to eq(3)
  end
end
