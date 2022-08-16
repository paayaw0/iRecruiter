require 'rails_helper'

RSpec.describe SocialMediaProfile, type: :model do
  let(:media_profile) { build(:social_media_profile) }

  # associations 
  it { should belong_to(:candidate) }
  
  # validations 
  it { should validate_presence_of(:name_of_platform) }
  it { should validate_presence_of(:social_media_handle) }
  it { should validate_presence_of(:url) }
end
