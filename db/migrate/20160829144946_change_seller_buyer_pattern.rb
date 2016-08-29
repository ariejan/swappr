class ChangeSellerBuyerPattern < ActiveRecord::Migration[5.0]
  def change
    rename_column :deals, :seller_id, :party_a_id
    rename_column :deals, :buyer_id,  :party_b_id

    rename_column :deals, :seller_bank_account_id, :party_a_bank_account_id
    rename_column :deals, :seller_address_id,      :party_a_address_id

    rename_column :deals, :buyer_bank_account_id, :party_b_bank_account_id
    rename_column :deals, :buyer_address_id,      :party_b_address_id
  end
end
