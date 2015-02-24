require 'rails_helper'

RSpec.describe "CreditCharges", type: :request do
  describe "GET /credit_charges" do
    it "works! (now write some real specs)" do
      get credit_charges_path
      expect(response).to have_http_status(200)
    end
  end
end
