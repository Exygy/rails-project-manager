class AddTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :project, index: true, null: false
      t.string :name
      t.string :description
      t.integer :status, null: 0

      t.timestamps
    end
  end
end