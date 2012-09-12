class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :team_id
      t.integer :opponent_id
      t.datetime :date
      t.integer :team_score
      t.integer :opponent_score
      t.boolean :home_team
      t.integer :year_id

      t.timestamps
    end
  end
end
