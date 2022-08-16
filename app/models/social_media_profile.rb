class SocialMediaProfile < ApplicationRecord
  belongs_to :candidate

  validates :name_of_platform,
            :social_media_handle,
            :url, presence: true
end
