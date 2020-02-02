class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.string :type
      t.integer :set
      t.integer :rep
      t.float :weight
      t.float :vol
      t.references :record, foreign_key: true

      t.timestamps
    end
  end
end
