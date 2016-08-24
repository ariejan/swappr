class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :user_id

      t.string :name
      t.string :address
      t.string :postcode
      t.string :city
      t.string :country

      t.boolean :default, default: false

      t.timestamps
    end
  end
end
