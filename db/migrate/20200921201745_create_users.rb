class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.boolean :is_client
      t.float :rating
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
