FactoryBot.define do
  factory :candidate_search_parameter do
    employment_status { false }
    city { Faker::Nation.capital_city }
    country { 'Ghana' }
    employment_history { Faker::Company.name }
    educational_background { Faker::University.name }
    programming_languages { Faker::ProgrammingLanguage.name }
    web_frameworks { 'Ruby on Rails' }
    other_technologies { 'PostgresSQL' }
    user { nil }
  end
end
