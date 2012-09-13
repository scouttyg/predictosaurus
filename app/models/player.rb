class Player < ActiveRecord::Base
  has_many :rosters
  has_many :teams, :through => :rosters
  attr_accessible :first_name, :last_name


  def self.find_player_named(full_name)
  	name_array = full_name.split
  	first_name = name_array[0]
  	last_name = name_array[1]
  	find(:first, :conditions => ["first_name like ? AND last_name like ?", "%#{first_name}%", "%#{last_name}%"])
  end

  def self.find_all_players_named(full_name)
  	name_array = full_name.split
  	first_name = name_array[0]
  	last_name = name_array[1]
  	find(:first, :conditions => ["first_name like ? AND last_name like ?", "%#{first_name}%", "%#{last_name}%"])
  end


end
