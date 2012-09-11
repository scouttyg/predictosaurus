class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :opponent1_id
      t.integer :opponent2_id
      t.datetime :date
      t.integer :opponent1_score
      t.integer :opponent2_score
      t.boolean :home_opponent1
      t.integer :year_id

      t.timestamps
    end
  end
end
