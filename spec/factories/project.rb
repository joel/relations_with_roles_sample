FactoryGirl.define do
  factory :project do
    name { generate(:name) }
    
    # FactoryGirl.create(:project, :with_users)
    # FactoryGirl.create(:project, :with_users, users_count: 2)
    trait :with_users do
      ignore do
        users_count 1
      end
      after_create do |project, evaluator|
        FactoryGirl.create_list(:relationship, evaluator.users_count, project: project)
      end  
    end
     
  end
end
    
