# This will guess the User class
FactoryBot.define do
    factory :user do
      username { Faker::Internet.username }
      email  { Faker::Internet.email }
      password { Faker::Internet.password }
      
      transient { recruiter { true } }
    end
  end