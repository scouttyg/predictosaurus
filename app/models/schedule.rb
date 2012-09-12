class Schedule < ActiveRecord::Base
  has_many :teams
  belongs_to :years
  attr_accessible :date, :team_id, :team_score, :opponent_id, :opponent_score, :home_team, :year_id
end
