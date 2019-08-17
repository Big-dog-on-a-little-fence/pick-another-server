require 'rails_helper'

RSpec.describe "tunings/show", type: :view do
  before(:each) do
    @tuning = assign(:tuning, Tuning.create!(
      :notes => "Notes",
      :name => "Name",
      :instrument_type => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Notes/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
