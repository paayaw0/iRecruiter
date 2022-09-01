require 'rails_helper'

RSpec.describe 'Dashboards', type: :request do
  let!(:headers) do
    {
      'Authorization' => token_generator(recruiter.id),
      'Content-Type' => 'application/json',
      'Accept' => 'application/vnd.irecruiter.v1+json'
    }
  end

  describe 'GET /hiring_pipeline' do
    let!(:recruiter) { create(:user, :recruiter) }

    context 'return candidates with various hiring details include hiring status' do
      context 'when tracked/monitored candidates are present' do
        let(:candidate1) { create(:candidate, hiring_status: 'initial contact') }
        let(:candidate2) { create(:candidate, hiring_status: 'salary negotiations') }
        let(:candidate3) { create(:candidate, hiring_status: 'hired') }

        before do
          recruiter.tracked_candidates.push(candidate1, candidate2, candidate3)
        end

        before { get '/dashboard/hiring_pipeline', headers: headers }

        it 'number of tracked candidates by recruiter is 3' do
          expect(json['data'].size).to eq(3)
        end

        it '1 hired candidate' do
          hired_candidate = json['data'].find { |candidate| candidate['attributes']['hiring_status'] == 'hired' }
          expect(hired_candidate['id'].to_i).to eq(candidate3.id)
        end

        it '1 initially contacted candidates' do
          initial_contact = json['data'].find do |candidate|
            candidate['attributes']['hiring_status'] == 'initial contact'
          end
          expect(initial_contact['id'].to_i).to eq(candidate1.id)
        end

        it 'should have 200 status code' do
          expect(response).to have_http_status(200)
        end
      end

      context 'when recruiter has no tracked candidates' do
        before { get '/dashboard/hiring_pipeline', headers: headers }

        it 'message should be no candidates tracked' do
          expect(json['data']['message']).to eq('You are not tracking any candidate')
        end

        it 'should have 200 status' do
          expect(response).to have_http_status(200)
        end

        it 'should have link to search_configuration endpoint' do
          expect(json['data']['links']['self']).to eq(dashboard_search_configuration_path)
        end
      end
    end
  end

  describe 'GET /custom_searches' do
    let!(:recruiter) { create(:user, :recruiter) }

    context 'list of custom searches if custom searches present' do
      let!(:senior_programmers) do
        create(:candidate_search_parameter, :senior_programmer,
               user_id: recruiter.id)
      end

      let!(:senior_accountants) do
        create(:candidate_search_parameter, :senior_accountant,
               user_id: recruiter.id)
      end

      before { get '/dashboard/custom_searches', headers: headers }

      context 'display' do
        it '2 custom searches' do
          expect(json['data'].size).to eq(2)
        end

        it 'should have 200 status' do
          expect(response).to have_http_status(200)
        end
        
      end
    end

    context 'link to set a custom search if no custom searches present' do
      before { get '/dashboard/custom_searches', headers: headers }

      context 'display' do 
        it 'message' do  
          expect(json['data']['message']).to eq('You have no custom searches')
        end

        it 'should have 200 status' do
          expect(response).to have_http_status(200)
        end

        it 'should have link to search_configuration endpoint' do
          expect(json['data']['links']['self']).to eq(dashboard_search_configuration_path)
        end
      end
    end
  end

  describe 'GET /search_configuration'
end
