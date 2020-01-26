class RemoveNameFromWorkout < ActiveRecord::Migration[5.2]
  def change
    remove_column :workouts, :name, :string
    add_reference :workouts, :mywork, foreign_key: true
    remove_reference :workouts, :record
  end
end
