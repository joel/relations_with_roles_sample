class Project < ActiveRecord::Base
  attr_accessible :name

  has_many :groups
  has_many :users, through: :relationships
  has_many :relationships, foreign_key: 'user_id', dependent: :destroy

  def add_group(name, roles)
    groups.create!(name: name, roles: roles)
  end
end
