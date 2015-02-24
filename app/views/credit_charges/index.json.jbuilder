json.array!(@credit_charges) do |credit_charge|
  json.extract! credit_charge, :id, :paid, :amount, :created, :currency, :refunded, :customer_id, :disputed
  json.url credit_charge_url(credit_charge, format: :json)
end
