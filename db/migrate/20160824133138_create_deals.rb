class CreateDeals < ActiveRecord::Migration[5.0]
  def change
    create_table :deals do |t|
      t.integer :seller_id
      t.integer :buyer_id

      t.integer :seller_bank_account_id
      t.integer :seller_address_id

      t.integer :buyer_bank_account_id
      t.integer :buyer_address_id

      t.string :title
      t.text :description

      t.integer :amount_cents

      t.string :payment_method

      t.string :transporter
      t.string :tracking_code

      t.datetime :notified_at, default: nil
      t.datetime :paid_at, default: nil
      t.datetime :shipped_at, default: nil
      t.datetime :received_at, default: nil

      t.integer :seller_rating, default: nil
      t.integer :buyer_rating, default: nil

      t.timestamps
    end
  end
end
