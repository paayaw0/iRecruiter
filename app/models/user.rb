class User < ApplicationRecord
  has_secure_password

  has_many :candidate_trackings
  has_many :tracked_candidates, through: :candidate_trackings,  source: :candidate

  validates :username, :email, :password_digest, presence: true
  validates_uniqueness_of :email
  validates :recruiter, inclusion: [true, false]
end
