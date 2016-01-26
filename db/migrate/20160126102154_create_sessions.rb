class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :name
      t.integer :counterfavs
      t.date :dateStart
      
      t.timestamps null: false
    end
  end
end
