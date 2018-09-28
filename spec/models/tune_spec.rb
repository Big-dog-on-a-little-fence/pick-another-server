require 'rails_helper'

RSpec.describe Tune, type: :model do
  before(:all) do
    @tune1 = create(:tune)
  end
  
  it "is valid with valid attributes" do
    expect(@tune1).to be_valid
  end

  it "has a unique name" do
    tune2 = build(:tune, name: @tune1.name)
    expect(tune2).to_not be_valid
  end

  it "has a long enough name" do
    tune2 = build(:tune, name: "hi")
    expect(tune2).to_not be_valid
  end

  it "has a valid key" do
    tune2 = build(:tune, name: "The Long Journey", key: "AminorLike")
    expect(tune2).to_not be_valid
  end
end
