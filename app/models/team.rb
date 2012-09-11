class Team < ActiveRecord::Base
  attr_accessible :location, :name, :stadium_capacity


  def self.instate_rivals(full_state_name)
  	all_teams_from_state = Team.where("location like ?", "%#{full_state_name}%").all
  	rivals = all_teams_from_state.sort_by{|team| team.stadium_capacity}.reverse.first(2)
  	return "#{rivals[0].name} is rivals with #{rivals[1].name}"
  end
end
