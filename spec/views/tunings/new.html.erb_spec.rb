require 'rails_helper'

RSpec.describe "tunings/new", type: :view do
  before(:each) do
    assign(:tuning, Tuning.new(
      :notes => "MyString",
      :name => "MyString",
      :instrument_type => 1
    ))
  end

  it "renders new tuning form" do
    render

    assert_select "form[action=?][method=?]", tunings_path, "post" do

      assert_select "input#tuning_notes[name=?]", "tuning[notes]"

      assert_select "input#tuning_name[name=?]", "tuning[name]"

      assert_select "input#tuning_instrument_type[name=?]", "tuning[instrument_type]"
    end
  end
end
