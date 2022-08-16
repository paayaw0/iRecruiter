require 'rails_helper'

RSpec.describe Employer, type: :model do
  let(:employer) { build(:employer) }

  # associations 
  it { should belong_to(:candidate) }
  
  # validations 
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:industry) }
  it { should validate_presence_of(:years_worked) }
  it { should validate_presence_of(:job_title) }
end
