FactoryBot.define do
  factory :social_media_profile do
    name_of_platform { "MyString" }
    social_media_handle { "MyString" }
    url { "MyString" }
    candidate { nil }
  end
end
