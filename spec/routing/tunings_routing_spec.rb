require "rails_helper"

RSpec.describe TuningsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/tunings").to route_to("tunings#index")
    end

    it "routes to #new" do
      expect(:get => "/tunings/new").to route_to("tunings#new")
    end

    it "routes to #show" do
      expect(:get => "/tunings/1").to route_to("tunings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tunings/1/edit").to route_to("tunings#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/tunings").to route_to("tunings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tunings/1").to route_to("tunings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tunings/1").to route_to("tunings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tunings/1").to route_to("tunings#destroy", :id => "1")
    end
  end
end
