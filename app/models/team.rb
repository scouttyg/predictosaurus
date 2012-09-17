class Team < ActiveRecord::Base
  has_many :rosters
  has_many :players, :through => :rosters
  has_many :schedules
  attr_accessible :location, :name, :stadium_capacity


  def self.instate_rivals(full_state_name)
  	all_teams_from_state = Team.where("location like ?", "%#{full_state_name}%").all
  	rivals = all_teams_from_state.sort_by{|team| team.stadium_capacity}.reverse.first(2)
  	return "#{rivals[0].name} is rivals with #{rivals[1].name}"
  end

  def roster(year)
  	yid = Year.find_by_year(year.to_i).id
  	self.rosters.find_all_by_year_id(yid)
  end

  def current_roster
  	self.roster(Time.now.year.to_i)
  end

  def self.years(school)
  	t = Team.find_by_name(school)
  	year_id_array = Schedule.find_all_by_team_id(t.id).map{ |i| i.year_id }.uniq
  	real_years = []
  	year_id_array.each{|id| real_years.push(Year.find(id).year)}
  	real_years
  end

  def schedule(year)
  	next_year =  year + 1
  	total_schedule = self.schedules.all(:conditions => { :date => DateTime.strptime("08/01/#{year}","%m/%d/%Y").. DateTime.strptime("01/10/#{next_year}","%m/%d/%Y")})
  	return total_schedule
  end

  def current_schedule
  	current_year = Time.now.year
  	return self.schedule(current_year)
  end


  def returning_starters(year)
  	current_roster = self.roster(year)
  	last_year_roster = self.roster(year-1)
  	current_roster_ids = return_team_ids(current_roster)
  	last_year_roster_ids = return_team_ids(last_year_roster)
  	intersection = current_roster_ids & last_year_roster_ids
  	percent =  '%.2f' % ((intersection.size.to_f/current_roster.size.to_f)*100)
  	return "#{percent}% of #{self.name}'s team is returning for #{year}"
  end

  def record(year)
  	total_schedule = self.schedule(year)
  	wins = 0
  	losses = 0
  	total_schedule.each do |game|
  		if !game.team_score.nil?
	  		if game.team_score > game.opponent_score
	  			wins +=1
	  		elsif game.team_score < game.opponent_score
	  			losses +=1
	  		end
	  	end
  	end
  	p "Record (Win/Loss): #{wins}-#{losses}"

  end

  private

  	def return_team_ids(array)
  		roster_ids = []
  		array.each do |player|
  			roster_ids.push(player.player_id)
  		end
  		return roster_ids
  	end


end
