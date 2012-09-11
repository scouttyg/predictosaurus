require 'csv'

def get_score(row, int)
    d =Date.strptime(row[2], '%m/%d/%y')
    n = Date.today

    if d >= n
        #then the score hasn't happened yet or just happened today, put nil for score
        return nil
    else
        if int == 1
            return row[5].to_i
        else
            return row[6].to_i
        end
    end
end

def get_score_retroactive(row,int)
    d =Date.strptime(row[0], '%m/%d/%y')
    if int == 1
        return row[2].to_i
    else
        return row[5].to_i
    end
end

def bool_home(row)
    if row[7] == "Home"
        return true
    else
        return false
    end
end

def bool_home_retroactive(row)
    if row[3] == "Home"
        return true
    else
        return false
    end
end

def get_year(row)
    d = Date.strptime(row[2], '%m/%d/%y')
    return Year.find_by_year(d.year).id
end

def get_year_retroactive(row)
    d = Date.strptime(row[0], '%m/%d/%y')
    return Year.find_by_year(d.year).id
end

def check_or_add_team(row)
    id = row[3].to_i
    team_name = row[4]
    if Team.find_by_id(id).nil?
        t = Team.new
        t.id = id
        t.name = team_name
        t.save!
    end
end

def check_or_add_team_retroactive(row)
    if Team.find_by_name(row[1]).nil?
        t = Team.new
        t.name = team_name
        t.save!
    end
    if Team.find_by_name(row[4]).nil?
        t = Team.new
        t.name = row[4]
        t.save!
    end
end

namespace :populate do
    namespace :y2012 do
        desc "Import schedule from csv file"
        task :import_schedules => [:environment] do
            file = "Schedule2012.csv"
            CSV.foreach("#{Rails.root}/db/seed_data/schedules/#{file}", :headers => true) do |row|
                Schedule.create(
                    :opponent1_id => row[0].to_i,
                    :opponent2_id => row[3].to_i,
                    :date => Date.strptime(row[2],'%m/%d/%y'),
                    :opponent1_score => get_score(row, 1),
                    :opponent2_score => get_score(row, 2),
                    :home_opponent1 => bool_home(row),
                    :year_id => get_year(row)
                )
                check_or_add_team(row)
            end
        end
    end
    namespace :y2011 do
        desc "Import schedule from csv file"
        task :import_schedules => [:environment] do
            file = "Schedule2011.csv"
            CSV.foreach("#{Rails.root}/db/seed_data/schedules/#{file}", :headers => true) do |row|
                Schedule.create(
                :opponent1_id => row[0].to_i,
                :opponent2_id => row[3].to_i,
                :date => Date.strptime(row[2],'%m/%d/%y'),
                :opponent1_score => get_score(row, 1),
                :opponent2_score => get_score(row, 2),
                :home_opponent1 => bool_home(row),
                :year_id => get_year(row)
                )
                check_or_add_team(row)
            end
        end
    end

    namespace :y2010 do
        desc "Import schedule from csv file"
        task :import_schedules => [:environment] do
            file = "Schedule2010.csv"
            CSV.foreach("#{Rails.root}/db/seed_data/schedules/#{file}", :headers => true) do |row|
                Schedule.create(
                :opponent1_id => row[0].to_i,
                :opponent2_id => row[3].to_i,
                :date => Date.strptime(row[2],'%m/%d/%y'),
                :opponent1_score => get_score(row, 1),
                :opponent2_score => get_score(row, 2),
                :home_opponent1 => bool_home(row),
                :year_id => get_year(row)
                )

                check_or_add_team(row)
            end
        end
    end

    namespace :y2009 do
        desc "Import schedule from csv file"
        task :import_schedules => [:environment] do
            file = "Schedule2009.csv"
            CSV.foreach("#{Rails.root}/db/seed_data/schedules/#{file}", :headers => true) do |row|
                Schedule.create(
                :opponent1_id => row[0].to_i,
                :opponent2_id => row[3].to_i,
                :date => Date.strptime(row[2],'%m/%d/%y'),
                :opponent1_score => get_score(row, 1),
                :opponent2_score => get_score(row, 2),
                :home_opponent1 => bool_home(row),
                :year_id => get_year(row)
                
                )
                check_or_add_team(row)
            end
        end
    end

    namespace :y2008 do
        desc "Import schedule from csv file"
        task :import_schedules => [:environment] do
            file = "Schedule2008.csv"
            CSV.foreach("#{Rails.root}/db/seed_data/schedules/#{file}", :headers => true) do |row|
                Schedule.create(
                :opponent1_id => row[0].to_i,
                :opponent2_id => row[3].to_i,
                :date => Date.strptime(row[2],'%m/%d/%y'),
                :opponent1_score => get_score(row, 1),
                :opponent2_score => get_score(row, 2),
                :home_opponent1 => bool_home(row),
                :year_id => get_year(row)
                )
                check_or_add_team(row)
            end
        end
    end

    namespace :y2007 do
        desc "Import schedule from csv file"
        task :import_schedules => [:environment] do
            file = "Schedule2007.csv"
            CSV.foreach("#{Rails.root}/db/seed_data/schedules/#{file}", :headers => true) do |row|
                Schedule.create(
                :opponent1_id => row[0].to_i,
                :opponent2_id => row[3].to_i,
                :date => Date.strptime(row[2],'%m/%d/%y'),
                :opponent1_score => get_score(row, 1),
                :opponent2_score => get_score(row, 2),
                :home_opponent1 => bool_home(row),
                :year_id => get_year(row)
                )
                check_or_add_team(row)
            end
        end
    end



    # This is where things go to shit

    namespace :y2006 do
        desc "Import schedule from csv file"
        task :import_schedules => [:environment] do
            file = "Schedule2006.csv"
            CSV.foreach("#{Rails.root}/db/seed_data/schedules/#{file}", :headers => true) do |row|
                check_or_add_team_retroactive(row)
                Schedule.create(
                :opponent1_id => Team.find_by_name(row[1]),
                :opponent2_id => Team.find_by_name(row[4]),
                :date => Date.strptime(row[0],'%m/%d/%y'),
                :opponent1_score => get_score_retroactive(row, 1),
                :opponent2_score => get_score_retroactive(row, 2),
                :home_opponent1 => bool_home_retroactive(row),
                :year_id => get_year_retroactive(row)
                )
            end
        end
    end

    namespace :y2005 do
        desc "Import schedule from csv file"
        task :import_schedules => [:environment] do
            file = "Schedule2005.csv"
            CSV.foreach("#{Rails.root}/db/seed_data/schedules/#{file}", :headers => true) do |row|
                check_or_add_team_retroactive(row)
                Schedule.create(
                :opponent1_id => Team.find_by_name(row[1]),
                :opponent2_id => Team.find_by_name(row[4]),
                :date => Date.strptime(row[0],'%m/%d/%y'),
                :opponent1_score => get_score_retroactive(row, 1),
                :opponent2_score => get_score_retroactive(row, 2),
                :home_opponent1 => bool_home_retroactive(row),
                :year_id => get_year_retroactive(row)
                )
            end
        end
    end

    namespace :y2004 do
        desc "Import schedule from csv file"
        task :import_schedules => [:environment] do
            file = "Schedule2004.csv"
            CSV.foreach("#{Rails.root}/db/seed_data/schedules/#{file}", :headers => true) do |row|
                check_or_add_team_retroactive(row)
                Schedule.create(
                :opponent1_id => Team.find_by_name(row[1]),
                :opponent2_id => Team.find_by_name(row[4]),
                :date => Date.strptime(row[0],'%m/%d/%y'),
                :opponent1_score => get_score_retroactive(row, 1),
                :opponent2_score => get_score_retroactive(row, 2),
                :home_opponent1 => bool_home_retroactive(row),
                :year_id => get_year_retroactive(row)
                )
            end
        end
    end

    namespace :y2003 do
        desc "Import schedule from csv file"
        task :import_schedules => [:environment] do
            file = "Schedule2003.csv"
            CSV.foreach("#{Rails.root}/db/seed_data/schedules/#{file}", :headers => true) do |row|
                check_or_add_team_retroactive(row)
                Schedule.create(
                :opponent1_id => Team.find_by_name(row[1]),
                :opponent2_id => Team.find_by_name(row[4]),
                :date => Date.strptime(row[0],'%m/%d/%y'),
                :opponent1_score => get_score_retroactive(row, 1),
                :opponent2_score => get_score_retroactive(row, 2),
                :home_opponent1 => bool_home_retroactive(row),
                :year_id => get_year_retroactive(row)
                )
            end
        end
    end


    namespace :y2002 do
        desc "Import schedule from csv file"
        task :import_schedules => [:environment] do
            file = "Schedule2002.csv"
            CSV.foreach("#{Rails.root}/db/seed_data/schedules/#{file}", :headers => true) do |row|
                check_or_add_team_retroactive(row)
                Schedule.create(
                :opponent1_id => Team.find_by_name(row[1]),
                :opponent2_id => Team.find_by_name(row[4]),
                :date => Date.strptime(row[0],'%m/%d/%y'),
                :opponent1_score => get_score_retroactive(row, 1),
                :opponent2_score => get_score_retroactive(row, 2),
                :home_opponent1 => bool_home_retroactive(row),
                :year_id => get_year_retroactive(row)
                )
            end
        end
    end

end
