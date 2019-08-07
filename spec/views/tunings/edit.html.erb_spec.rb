require 'rails_helper'

RSpec.describe "tunings/edit", type: :view do
  before(:each) do
    @tuning = assign(:tuning, Tuning.create!(
      :notes => "MyString",
      :name => "MyString",
      :instrument_type => 1
    ))
  end

  it "renders the edit tuning form" do
    render

    assert_select "form[action=?][method=?]", tuning_path(@tuning), "post" do

      assert_select "input#tuning_notes[name=?]", "tuning[notes]"

      assert_select "input#tuning_name[name=?]", "tuning[name]"

      assert_select "input#tuning_instrument_type[name=?]", "tuning[instrument_type]"
    end
  end
end
