FactoryBot.define do
  factory :candidate_search_parameter do
    # user { nil }
    city { Faker::Address.city }
    country { Faker::Address.country }
    employment_status { Faker::Boolean.boolean }
    employment_history { Faker::Company.name }
    educational_background { Faker::University.name }
    programming_languages { Faker::ProgrammingLanguage.name }
    web_frameworks { 'Ruby on Rails, Phoenix' }
    search_type { 'loose' }
    title_search { 'search for Senior Developers' }
    level_of_skill { 'senior' }
    configuration_label { 'Senior Devs Search' }
    
    trait :senior_programmer do
      city { 'Accra' }
      country { 'Ghana' }
      employment_status { false }
      employment_history { 'Google, Meta, Twitter, Netflix' }
      educational_background { 'University of Ghana, MIT, UCLA' }
      programming_languages { 'Ruby, Elixir' }
      web_frameworks { 'Ruby on Rails, Phoenix' }
      other_technologies { 'ElasticSearch, PostgreSQL, Redis, AWS, Docker, kubernetes' }
      configuration_label { 'search for Senior Software Engineers' }
      title_search { 'Senior Software Engineer' }
      search_type { 'loose'}
    end

    trait :senior_accountant do 
      city { 'London' }
      country { 'England' }
      employment_status { true }
      employment_history { 'GoldmanSachs, JP Morgan' }
      educational_background { Faker::University.name }
      configuration_label { 'search for Chartered Acountants' }
      title_search { 'Senior Chartered Accountant' }
      search_type { 'exact' }
    end
  end
end
