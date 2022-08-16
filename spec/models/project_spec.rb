require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) { build(:project) }

  # associations
  it { should belong_to(:candidate) } 

  # validations
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:url) }
end
