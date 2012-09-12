class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.integer :team_id
      t.integer :player_id
      t.integer :uniform_number
      t.string :position
      t.string :year_college
      t.integer :year_id

      t.timestamps
    end
  end
end
