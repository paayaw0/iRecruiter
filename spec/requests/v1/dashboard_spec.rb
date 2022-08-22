require 'rails_helper'

RSpec.describe 'Dashboards', type: :request do
  describe 'GET /hiring_pipeline' do
    let!(:recruiter) { create(:user, :recruiter) }
    let!(:headers) do
      {
        'Authorization' => token_generator(recruiter.id),
        'Content-Type' => 'application/json'
      }
    end

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
      end

      context 'when recruiter has no tracked candidates' do
        before { get '/dashboard/hiring_pipeline', headers: headers }

        it 'message should be no candidates tracked' do
          expect(json['data']['message']).to eq('You are not tracking any candidate')
        end

        it 'should have 200 status' do
          expect(response).to have_http_status(200)
        end

        it 'should have link to search_configuration endpoint'
      end
    end
  end

  describe 'GET /search_configuration'
end
