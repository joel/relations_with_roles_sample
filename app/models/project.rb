class Project < ActiveRecord::Base
  attr_accessible :name

  has_many :users, through: :relationships
  has_many :relationships, foreign_key: 'user_id', dependent: :destroy
end
