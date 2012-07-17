class Relationship < ActiveRecord::Base
  attr_accessible :project_id, :roles, :user_id
end
