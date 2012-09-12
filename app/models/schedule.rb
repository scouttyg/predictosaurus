class Schedule < ActiveRecord::Base
  has_many :teams, :primary_key => :opponent1_id
  belongs_to :years
  attr_accessible :date, :home_opponent1, :opponent1_id, :opponent1_score, :opponent2_id, :opponent2_score, :year_id
end
