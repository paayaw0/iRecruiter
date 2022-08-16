require 'rails_helper'

RSpec.describe EducationalBackground, type: :model do
  let(:ed_background) { build(:educational_background) }

  # associations 
  it { should belong_to(:candidate) }
  
  
  # validations 
  it { should validate_presence_of(:name_of_school) }
  it { should validate_presence_of(:qualification) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }
  it { should validate_presence_of(:courses) }
end
