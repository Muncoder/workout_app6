class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :star
      t.text :comments
      t.references :user, index: true, foreign_key: true
      t.references :workout, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
