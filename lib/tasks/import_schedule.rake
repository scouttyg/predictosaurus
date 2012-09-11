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

def bool_home(row)
    if row[7] == "Home"
        return true
    else
        return false
    end
end

def get_year(row)
    d = Date.strptime(row[2], '%m/%d/%y')
    return Year.find_by_year(d.year).id
end

namespace :populate do
    desc "Import schedule from csv file"
    task :import_schedules => [:environment] do
        file = "Schedule2012.csv"
        CSV.foreach("#{Rails.root}/db/#{file}", :headers => true) do |row|
            Schedule.create(
            :opponent1_id => row[0].to_i,
            :opponent2_id => row[3].to_i,
            :date => Date.strptime(row[2],'%m/%d/%y'),
            :opponent1_score => get_score(row, 1),
            :opponent2_score => get_score(row, 2),
            :home_opponent1 => bool_home(row),
            :year_id => get_year(row)
            )
        end
    end
end
