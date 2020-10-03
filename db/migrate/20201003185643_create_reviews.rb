class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.string :comment
      t.float :rating

      t.timestamps
    end
  end
end
