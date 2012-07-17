class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :project_id
      t.string :roles

      t.timestamps
    end
  end
end
