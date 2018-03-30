require 'test_helper'

class TuneTest < ActiveSupport::TestCase
  test "should not save tune without name or key" do
    tune = Tune.new
    assert_not tune.save
  end
  
  test "should not save tune without name" do
    tune = Tune.new
    tune.key = "Bb"
    assert_not tune.save
  end

  test "should not save tune without key" do
    tune = Tune.new
    tune.name = "Weird Tune Name"
    assert_not tune.save
  end

  test "should save with tune and key" do
    tune = Tune.new
    tune.name = "Weird Tune Name"
    tune.key = "Am"
    assert tune.save
  end
end
