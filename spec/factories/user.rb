# This will guess the User class
FactoryBot.define do
    factory :user do
      username { Faker::Internet.username }
      email  { Faker::Internet.email }
      password { Faker::Internet.password }
      
      trait :recruiter do 
        recruiter { true }
      end

      trait :non_recruiter do 
        recruiter { false }
      end
    end
  end