class Team < ActiveRecord::Base
  has_many :rosters
  has_many :players, :through => :rosters
  has_many :schedules, :foreign_key => "opponent1_id"
  has_many :years, :through => :schedules, :foreign_key => 'opponent1_id'
  attr_accessible :location, :name, :stadium_capacity


  def self.instate_rivals(full_state_name)
  	all_teams_from_state = Team.where("location like ?", "%#{full_state_name}%").all
  	rivals = all_teams_from_state.sort_by{|team| team.stadium_capacity}.reverse.first(2)
  	return "#{rivals[0].name} is rivals with #{rivals[1].name}"
  end

  def current_roster
  	yid = Year.find_by_year(Time.now.year.to_i).id
  end

end
