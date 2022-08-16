FactoryBot.define do
  factory :educational_background do
    name_of_school { "MyString" }
    qualification { "MyString" }
    start_date { "2022-08-16 13:21:39" }
    end_date { "2022-08-16 13:21:39" }
    courses { "MyText" }
    candidate { nil }
  end
end
