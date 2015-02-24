class CreateCreditCharges < ActiveRecord::Migration
  def change
    create_table :credit_charges do |t|
      t.boolean :paid
      t.integer :amount
      t.integer :created
      t.string :currency
      t.boolean :refunded
      t.integer :customer_id
      t.boolean :disputed

      t.timestamps
    end
  end
end
