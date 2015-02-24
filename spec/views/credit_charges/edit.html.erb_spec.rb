require 'rails_helper'

RSpec.describe "credit_charges/edit", type: :view do
  before(:each) do
    @credit_charge = assign(:credit_charge, CreditCharge.create!(
      :paid => false,
      :amount => 1,
      :created => 1,
      :currency => "MyString",
      :refunded => false,
      :customer_id => 1,
      :disputed => false
    ))
  end

  it "renders the edit credit_charge form" do
    render

    assert_select "form[action=?][method=?]", credit_charge_path(@credit_charge), "post" do

      assert_select "input#credit_charge_paid[name=?]", "credit_charge[paid]"

      assert_select "input#credit_charge_amount[name=?]", "credit_charge[amount]"

      assert_select "input#credit_charge_created[name=?]", "credit_charge[created]"

      assert_select "input#credit_charge_currency[name=?]", "credit_charge[currency]"

      assert_select "input#credit_charge_refunded[name=?]", "credit_charge[refunded]"

      assert_select "input#credit_charge_customer_id[name=?]", "credit_charge[customer_id]"

      assert_select "input#credit_charge_disputed[name=?]", "credit_charge[disputed]"
    end
  end
end
