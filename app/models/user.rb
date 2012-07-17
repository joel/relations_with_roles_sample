class User < ActiveRecord::Base
  attr_accessible :name
  
  has_many :projects, through: :relationships
  has_many :relationships, foreign_key: 'project_id', dependent: :destroy
end
