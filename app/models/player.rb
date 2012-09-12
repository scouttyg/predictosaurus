class Player < ActiveRecord::Base
  has_many :rosters
  has_many :teams, :through => :rosters
  has_many :years, :through => :rosters
  attr_accessible :first_name, :last_name


  def self.find_full_name(first_name,last_name)
  	find(:all, :conditions => ["first_name like ? AND last_name like ?", "%#{first_name}%", "%#{last_name}%"])
  end

end
