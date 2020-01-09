class RenameWorkoutsTypeToName < ActiveRecord::Migration[5.2]
  def change
    rename_column :workouts, :type, :name
  end
end
