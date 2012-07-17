class Relationship < ActiveRecord::Base
  attr_accessible :project_id, :user_id, :group_id
  
  belongs_to :user
  belongs_to :project
  belongs_to :group
end