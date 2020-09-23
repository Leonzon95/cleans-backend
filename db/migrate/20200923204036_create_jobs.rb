class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true
      t.datetime :date
      t.integer :hired_cleaner
      t.string :status
      t.string :description

      t.timestamps
    end
  end
end
