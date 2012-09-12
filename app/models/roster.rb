class Roster < ActiveRecord::Base
  attr_accessible :player_id, :position, :team_id, :uniform_number, :year_college, :year_id
end
