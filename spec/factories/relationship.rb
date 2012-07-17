FactoryGirl.define do
  factory :relationship do
    user
    project
    roles ['create', 'remove', 'treat', 'close'].join(',')
  end
end
