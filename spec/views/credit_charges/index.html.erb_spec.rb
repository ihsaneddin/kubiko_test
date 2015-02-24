require 'rails_helper'

RSpec.describe "credit_charges/index", type: :view do
  before(:each) do
    @credit_charges = CreditCharge.all
    render
  end

  it "renders three list of credit_charges type" do
    assert_select 'table', count: 3
  end

  it 'renders list of failed credit_charges' do 
    assert_select 'table#failed' do |e|
      assert_select 'tbody>tr', count: @credit_charges.status('failed').count 
    end
  end

  it 'renders list of disputed credit_charges' do 
    assert_select 'table#disputed' do |e|
      assert_select 'tbody>tr', count: @credit_charges.status('disputed').count
    end
  end

  it 'renders list of successful credit_charges' do 
    assert_select 'table#successful' do |e|
      assert_select 'tbody>tr', count: @credit_charges.status('successful').count
    end
  end

end
