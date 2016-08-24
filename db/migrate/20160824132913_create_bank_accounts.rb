class CreateBankAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :bank_accounts do |t|
      t.integer :user_id

      t.string :name
      t.string :bank_name
      t.string :iban
      t.string :bic

      t.boolean :default, default: false

      t.timestamps
    end
  end
end
