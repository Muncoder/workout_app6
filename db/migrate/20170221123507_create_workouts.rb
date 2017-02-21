class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :title
      t.text :description
      t.datetime :workout_date

      t.timestamps null: false
    end
  end
end
