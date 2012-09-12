class Year < ActiveRecord::Base
  has_many :teams, :through => :schedules, :foreign_key => 'opponent1_id'
  has_many :players, :through => :rosters
  has_many :rosters
  has_many :schedules
  attr_accessible :year

end
