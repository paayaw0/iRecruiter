require 'rails_helper'

RSpec.describe CandidateSearchParameter, type: :model do
  let(:candidate_search_parameters) { build(:candidate_search_parameter) }

  # association
  it { should belong_to(:user) } 

  # validations 
  it { should validate_presence_of(:configuration_label) }
  it { should validate_presence_of(:title_search) }
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:search_type) }
end
