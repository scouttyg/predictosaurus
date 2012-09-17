class CreateOffenseStats < ActiveRecord::Migration
  def change
    create_table :offense_stats do |t|
      t.integer :team_id
      t.integer :schedule_id
      t.integer :player_id
      t.integer :rushing_attempts
      t.integer :rushing_gains
      t.integer :rushing_losses
      t.integer :rushing_net
      t.integer :rushing_tds
      t.integer :conversion
      t.integer :offensive_plays
      t.integer :offensive_yards
      t.integer :catches
      t.integer :catching_yards
      t.integer :catching_tds
      t.integer :pass_int_number
      t.integer :pass_int_yards
      t.integer :pass_int_tds
      t.integer :fumble_ret_number
      t.integer :fumble_ret_yards
      t.integer :fumble_ret_tds
      t.integer :punting_number
      t.integer :punting_yards
      t.integer :punt_return_number
      t.integer :punt_return_yards
      t.integer :punt_return_tds
      t.integer :ko_return_number
      t.integer :ko_return_yards
      t.integer :ko_return_tds
      t.integer :total_tds
      t.integer :offensive_xpts_kicks_attempted
      t.integer :offensive_xpts_kicks_made
      t.integer :rp_attempted
      t.integer :rp_made
      t.integer :defensive_xpts_kicks_attempted
      t.integer :defensive_xpts_kicks_made
      t.integer :fg_attempted
      t.integer :fg_made
      t.integer :safeties
      t.integer :points

      t.timestamps
    end
  end
end
