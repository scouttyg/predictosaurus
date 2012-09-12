class Year < ActiveRecord::Base
  has_many :teams, :through => :schedules
  has_many :players, :through => :rosters
  has_many :rosters
  has_many :schedules
  attr_accessible :year

end
