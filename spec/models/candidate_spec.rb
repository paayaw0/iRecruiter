require 'rails_helper'

RSpec.describe Candidate, type: :model do
  let(:candidate) { build(:candidate) }

  # associations 
  it { should have_many(:employers) } #employment history
  it { should have_many(:educational_backgrounds) }
  it { should have_many(:projects) }
  it { should have_many(:social_media_profiles) }
  # it { should have_many(:networks) } #friends, associates, colleagues     

  # validations 
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:sex) }
  it { should validate_presence_of(:github_profile) }
  it { should validate_presence_of(:linkedin_profile) }
  it { should validate_presence_of(:current_location) }
  it { should validate_presence_of(:employment_status) }
  it { should validate_presence_of(:current_employer) }
end
