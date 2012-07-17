class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :user_id
      t.integer :project_id
      t.integer :group_id

      t.timestamps
    end
  end
end
