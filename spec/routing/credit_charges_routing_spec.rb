require "rails_helper"

RSpec.describe CreditChargesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/credit_charges").to route_to("credit_charges#index")
    end

    it "routes to #new" do
      expect(:get => "/credit_charges/new").to route_to("credit_charges#new")
    end

    it "routes to #show" do
      expect(:get => "/credit_charges/1").to route_to("credit_charges#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/credit_charges/1/edit").to route_to("credit_charges#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/credit_charges").to route_to("credit_charges#create")
    end

    it "routes to #update" do
      expect(:put => "/credit_charges/1").to route_to("credit_charges#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/credit_charges/1").to route_to("credit_charges#destroy", :id => "1")
    end

  end
end
