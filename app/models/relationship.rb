class Relationship < ActiveRecord::Base
  attr_accessible :project_id, :roles, :user_id
  
  belongs_to :user
  belongs_to :project
  belongs_to :group
end