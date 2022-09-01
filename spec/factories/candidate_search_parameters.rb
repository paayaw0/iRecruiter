FactoryBot.define do
  factory :candidate_search_parameter do
    user { nil }
    
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
      title_search { 'search for Senior Software Engineers' }
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
