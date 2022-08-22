FactoryBot.define do
  factory :candidate do
    email { Faker::Internet.email }
    name { email.split('@').join(' ').split('.')[0] }
    employment_status { "MyString" }
    work_mode { "MyString" }
    linkedin_profile { "MyString" }
    github_profile { "MyString" }
    personal_website { "MyString" }
    current_location { Faker::Address.country }
    social_network_profiles { "MyString" }
    hiring_status { "MyString" }
    sex { 'M' }
    current_employer { Faker::Company.name }
  end
end
