class Group < ActiveRecord::Base
  attr_accessible :name, :project_id, :roles

  has_many :groups
end
