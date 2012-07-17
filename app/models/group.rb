class Group < ActiveRecord::Base
  attr_accessible :name, :project_id, :roles

  has_many :groups
  
  def plist_hash
    { 'name' => name, 'rights' => roles, 'web_id' => id }
  end

end
