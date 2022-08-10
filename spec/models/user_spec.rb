require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  # validations 
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  # associations
end
