class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :country
      t.string :state
      t.string :zipcode
      t.string :city
      t.string :street_address

      t.timestamps
    end
  end
end
