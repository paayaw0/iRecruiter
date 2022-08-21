require 'rails_helper'

RSpec.describe CandidateTracking, type: :model do
  let(:candidate_tracking) { build(:candidate_tracking) }

  # associations 
  it { should belong_to(:user) }
  it { should belong_to(:candidate) }
end
