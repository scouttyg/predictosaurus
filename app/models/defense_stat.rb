class DefenseStat < ActiveRecord::Base
  attr_accessible :blocked_kicks, :forced_fumbles, :pass_breakups, :player_id, :qb_hurries, :sacks_asssited, :sacks_unassisted, :schedule_id, :tackles_assisted, :tackles_for_losses_assisted, :tackles_for_losses_unassisted, :tackles_for_losses_yards, :tackles_unassisted, :team_id
end
