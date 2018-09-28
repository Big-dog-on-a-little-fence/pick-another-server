require 'rails_helper'

RSpec.describe Repertoire, type: :model do
  before(:all) do
    @user1 = create(:unique_user)
    @tune1 = create(:tune)
    @repertoire1 = create(:repertoire, user: @user1, tune: @tune1)
  end
  
  it "is valid with valid attributes" do
    expect(@repertoire1).to be_valid
  end

  it "is not valid without a user" do 
    repertoire2 = build(:repertoire, user: nil)
    expect(repertoire2).to_not be_valid
  end
  
  it "is not valid without a tune" do 
    repertoire2 = build(:repertoire, tune: nil)
    expect(repertoire2).to_not be_valid
  end
end
