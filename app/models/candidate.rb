class Candidate < ApplicationRecord
  has_many :employers, dependent: :destroy
  has_many :educational_backgrounds, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :social_media_profiles, dependent: :destroy
  has_many :candidate_trackings
  has_many :tracking_recruiters, -> { where(recruiter: true) }, class_name: 'User', through: :candidate_trackings, source: :user
#   has_many :networks, dependent: :destroy

  validates :email, 
            :name, 
            :sex, 
            :github_profile, 
            :linkedin_profile,
            :current_location,
            :employment_status,
            :current_employer, presence: true
end
