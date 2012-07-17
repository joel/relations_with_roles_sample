FactoryGirl.define do
  factory :role do
    roles ['create', 'remove', 'treat', 'close'].join(',')
  end
end