class Roster < ActiveRecord::Base
	belongs_to :player
	belongs_to :team
	attr_accessible :player_id, :position, :team_id, :uniform_number, :year_college, :year_id
end
