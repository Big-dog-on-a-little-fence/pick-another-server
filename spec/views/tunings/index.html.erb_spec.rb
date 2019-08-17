require 'rails_helper'

RSpec.describe "tunings/index", type: :view do
  before(:each) do
    assign(:tunings, [
      Tuning.create!(
        :notes => "Notes",
        :name => "Name",
        :instrument_type => 2
      ),
      Tuning.create!(
        :notes => "Notes",
        :name => "Name",
        :instrument_type => 2
      )
    ])
  end

  it "renders a list of tunings" do
    render
    assert_select "tr>td", :text => "Notes".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
