require 'rails_helper'

RSpec.describe CandidateSearchParameter, type: :model do
  let(:candidate_search_parameters) { build(:candidate_search_parameter) }

  # association
  it { should belong_to(:user) } 
end
