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
        task :import_rosters => [:environment] do
            file = "Rosters2012.csv"
            CSV.foreach("#{Rails.root}/db/seed_data/rosters/#{file}", :headers => true) do |row|
                Roster.create(
                    :team_id => row[0].to_i,
                    :player_id => row[7].to_i,
                    :uniform_number => row[2],
                    :position => row[5],
                    :year_college => row[6],
                    :year_id => 11 #No year in data, so just have to manually put it in
                )

                p = Player.new
                p.id = row[7].to_i
                p.first_name = row[4]
                p.last_name = row[3]
                p.save!
            end
        end
    end
end
