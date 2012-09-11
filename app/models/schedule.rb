class Schedule < ActiveRecord::Base
  attr_accessible :date, :home_opponent1, :opponent1_id, :opponent1_score, :opponent2_id, :opponent2_score, :year_id
end
