class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :title
      t.text :description
      t.datetime :start_time
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :records, [:user_id, :start_time]
  end
end
