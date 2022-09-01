require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  # validations 
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }

  # associations
  it { should have_many(:candidate_trackings) }
  it { should have_many(:tracked_candidates).through(:candidate_trackings).source(:candidate) }
  it { should have_many(:custom_searches).class_name('CandidateSearchParameter') }
end
