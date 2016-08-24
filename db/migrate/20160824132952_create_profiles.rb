class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id

      t.string :full_name
      t.string :phone_number

      t.timestamps
    end
  end
end
