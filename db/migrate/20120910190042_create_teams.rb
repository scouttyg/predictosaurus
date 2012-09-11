class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :location
      t.integer :stadium_capacity

      t.timestamps
    end
  end
end
