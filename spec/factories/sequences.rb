FactoryGirl.define do
  sequence :name do |n|
    "John Doe #{n}_#{rand(10000 * n)}"
  end
  sequence :email do |n|
    "john_#{n}#{rand(10000 * n)}@test.com"
  end
end
