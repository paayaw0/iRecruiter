class User < ApplicationRecord
  validates :username, :email, :password_digest, presence: true
  validates_uniqueness_of :email
end
