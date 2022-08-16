require 'rails_helper'

RSpec.describe "Dashboards", type: :request do
  describe 'GET /hiring_pipeline' do  
    context 'return candidates with various hiring details include hiring status' do 
      context 'when tracked/monitored candidates are present' do 
        it 'number of tracked candidates by recruiter'
        it '3 hired candidates' 
        it '10 initially contacted candidates'
      end

      context 'when recruiter has no tracked candidates' do 
        it 'message should be no candidates tracked'
        it 'should have link to search_configuration endpoint'
      end
    end
  end

  describe 'GET /search_configuration'
end
