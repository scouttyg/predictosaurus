class Roster < ActiveRecord::Base
	belongs_to :player
	belongs_to :team
	has_many :years
	attr_accessible :player_id, :position, :team_id, :uniform_number, :year_college, :year_id
end
