FactoryBot.define do
  factory :employer do
    name { "MyString" }
    industry { "MyString" }
    years_worked { 1 }
    job_title { "MyString" }
    candidate { nil }
  end
end
