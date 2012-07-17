FactoryGirl.define do
  factory :group do
    roles ['create', 'remove', 'treat', 'close'].join(',')
  end
end