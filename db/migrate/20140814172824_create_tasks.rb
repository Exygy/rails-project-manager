class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.integer :rdifficulty_level
      t.timestamps
    end
  end
end
