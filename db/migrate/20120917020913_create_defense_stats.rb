class CreateDefenseStats < ActiveRecord::Migration
  def change
    create_table :defense_stats do |t|
      t.integer :team_id
      t.integer :schedule_id
      t.integer :player_id
      t.integer :tackles_unassisted
      t.integer :tackles_assisted
      t.integer :tackles_for_losses_unassisted
      t.integer :tackles_for_losses_assisted
      t.integer :tackles_for_losses_yards
      t.integer :sacks_unassisted
      t.integer :sacks_yards 
      t.integer :sacks_asssited
      t.integer :pass_breakups
      t.integer :forced_fumbles
      t.integer :qb_hurries
      t.integer :blocked_kicks

      t.timestamps
    end
  end
end
