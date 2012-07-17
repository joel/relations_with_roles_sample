class Project < ActiveRecord::Base
  attr_accessible :name

  has_many :groups
  has_many :users, through: :relationships
  has_many :relationships, foreign_key: 'user_id', dependent: :destroy

  def user(user_name)
    users.find_by_name user_name
  end

  def group(group_name)
    groups.find_by_name group_name
  end

  def add_group(name, roles)
    groups.create!(name: name, roles: roles) unless Group.find_by_name(name)
  end
  
  def add_user(user_name, group_name)
    relationships.create!(user_id: User.find_by_name(user_name).id, group_id: Group.find_by_name(group_name).id)
  end
  
  def users_by_group(group_name)
    relationships.where(group_id: Group.find_by_name(group_name)).all.collect { |r| r.user }
  end
  
  def authors
    relationships.all.collect { |r| r.plist_hash }
  end
end
