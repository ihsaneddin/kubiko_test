require 'rails_helper'

RSpec.describe "credit_charges/show", type: :view do
  before(:each) do
    @credit_charge = assign(:credit_charge, CreditCharge.create!(
      :paid => false,
      :amount => 1,
      :created => 2,
      :currency => "Currency",
      :refunded => false,
      :customer_id => 3,
      :disputed => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Currency/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/false/)
  end
end
