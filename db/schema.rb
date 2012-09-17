# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120917030712) do

  create_table "defense_stats", :force => true do |t|
    t.integer  "team_id"
    t.integer  "schedule_id"
    t.integer  "player_id"
    t.integer  "tackles_unassisted"
    t.integer  "tackles_assisted"
    t.integer  "tackles_for_losses_unassisted"
    t.integer  "tackles_for_losses_assisted"
    t.integer  "tackles_for_losses_yards"
    t.integer  "sacks_unassisted"
    t.integer  "sacks_yards"
    t.integer  "sacks_asssited"
    t.integer  "pass_breakups"
    t.integer  "forced_fumbles"
    t.integer  "qb_hurries"
    t.integer  "blocked_kicks"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "offense_stats", :force => true do |t|
    t.integer  "team_id"
    t.integer  "schedule_id"
    t.integer  "player_id"
    t.integer  "rushing_attempts"
    t.integer  "rushing_gains"
    t.integer  "rushing_losses"
    t.integer  "rushing_net"
    t.integer  "rushing_tds"
    t.integer  "conversion"
    t.integer  "offensive_plays"
    t.integer  "offensive_yards"
    t.integer  "catches"
    t.integer  "catching_yards"
    t.integer  "catching_tds"
    t.integer  "pass_int_number"
    t.integer  "pass_int_yards"
    t.integer  "pass_int_tds"
    t.integer  "fumble_ret_number"
    t.integer  "fumble_ret_yards"
    t.integer  "fumble_ret_tds"
    t.integer  "punting_number"
    t.integer  "punting_yards"
    t.integer  "punt_return_number"
    t.integer  "punt_return_yards"
    t.integer  "punt_return_tds"
    t.integer  "ko_return_number"
    t.integer  "ko_return_yards"
    t.integer  "ko_return_tds"
    t.integer  "total_tds"
    t.integer  "offensive_xpts_kicks_attempted"
    t.integer  "offensive_xpts_kicks_made"
    t.integer  "rp_attempted"
    t.integer  "rp_made"
    t.integer  "defensive_xpts_kicks_attempted"
    t.integer  "defensive_xpts_kicks_made"
    t.integer  "fg_attempted"
    t.integer  "fg_made"
    t.integer  "safeties"
    t.integer  "points"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "players", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rosters", :force => true do |t|
    t.integer  "team_id"
    t.integer  "player_id"
    t.integer  "uniform_number"
    t.string   "position"
    t.string   "year_college"
    t.integer  "year_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "schedules", :force => true do |t|
    t.integer  "team_id"
    t.integer  "opponent_id"
    t.datetime "date"
    t.integer  "team_score"
    t.integer  "opponent_score"
    t.boolean  "home_team"
    t.integer  "year_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.integer  "stadium_capacity"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "years", :force => true do |t|
    t.integer  "year"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
