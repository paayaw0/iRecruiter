require 'rails_helper'

RSpec.describe 'Dashboards', type: :request do
  let!(:headers) do
    {
      'Authorization' => token_generator(recruiter.id),
      'Accept' => 'application/vnd.irecruiter.v1+json'
    }
  end

  describe 'GET /hiring-pipeline' do
    let!(:recruiter) { create(:user, :recruiter) }

    context 'return candidates with various hiring details include hiring status' do
      context 'when tracked/monitored candidates are present' do
        let(:candidate1) { create(:candidate, hiring_status: 'initial contact') }
        let(:candidate2) { create(:candidate, hiring_status: 'salary negotiations') }
        let(:candidate3) { create(:candidate, hiring_status: 'hired') }

        before do
          recruiter.tracked_candidates.push(candidate1, candidate2, candidate3)
        end

        before { get '/dashboard/hiring-pipeline', headers: headers }

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
        before { get '/dashboard/hiring-pipeline', headers: headers }

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

  describe 'GET /custom-searches' do
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

      before { get '/dashboard/custom-searches', headers: headers }

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
      before { get '/dashboard/custom-searches', headers: headers }

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

  describe 'POST /dashboard/create-candidate-search-configuration' do
    let!(:recruiter) { create(:user, :recruiter) }

    context 'create custom searches with valid payload' do 
      let!(:valid_payload) {
        attributes_for(:candidate_search_parameter, :senior_programmer, title_search: 'Senior Software Engineer',
                                                                        configuration_label: 'Search for Senior Software Engineers'
                                                                      )
      }.to_json

      before { post '/dashboard/create-candidate-search-configuration', params: valid_payload, headers: headers }

      it 'should return search parameter' do 
        expect(json['data']['attributes']['configuration_label']).to eq('Search for Senior Software Engineers')  
      end

      it 'should return 201 response status' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when payload is invalid' do 
      let!(:invalid_payload) {
        attributes_for(:candidate_search_parameter, :senior_programmer, title_search: 'Senior Software Engineer',
          configuration_label: 'Search for Senior Software Engineers'
        ).except(:title_search)
      }.to_json

      before { post '/dashboard/create-candidate-search-configuration', params: invalid_payload, headers: headers }

      it 'should return search parameter' do 
        expect(json['error']['message']).to eq("Validation failed: Title search can't be blank")  
      end

      it 'should return 422 response status' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PATCH /dashboard/:id/update-candidate-search-configuration' do 
    let!(:recruiter) { create(:user, :recruiter) }

    context 'update custom search with valid payload' do
      let!(:custom_search) { create(:candidate_search_parameter, :senior_programmer, user_id: recruiter.id) } 
      let!(:valid_payload) { 
        {
          programming_languages: 'Ruby, Elixir, JavaScript, C',
          search_type: 'exact',
          title_search: 'Senior Software Architect'
        }
      }.to_json

      it 'before update' do 
        expect(custom_search.title_search).to eq('Senior Software Engineer')
      end

      before { patch "/dashboard/#{custom_search.id}/update-candidate-search-configuration", params: valid_payload, headers: headers }

      it 'returns 204 status code' do 
        expect(response).to have_http_status(204)
      end

      it 'after update' do 
        expect(custom_search.reload.title_search).to eq('Senior Software Architect')
      end
    end
  end

  describe 'DELETE /dashboard/:id/remove-custom-search' do 
    let!(:recruiter) { create(:user, :recruiter) }

    context 'delete custom search' do 
      let!(:custom_search) { create(:candidate_search_parameter, :senior_programmer, user_id: recruiter.id) }

      it 'deletes custom_search' do 
        expect{ delete "/dashboard/#{custom_search.id}/remove-custom-search", headers: headers }.to change(CandidateSearchParameter, :count).by(-1)
      end

      it 'return 204 no content' do 
        delete "/dashboard/#{custom_search.id}/remove-custom-search", headers: headers
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'POST /dashboard/track-candidate' do
    let!(:recruiter) { create(:user, :recruiter) }

    context 'recruiter can track candidate' do 
      let(:candidate1) { create(:candidate) }
      let!(:candidate2) { create(:candidate) }

      let!(:valid_payload) {
        {
          data: 
            {
              type: "candidate",
              id: "#{candidate1.id}"
            }
        }
      }.to_json
      

      it 'successfully tracked candidate' do 
        post "/dashboard/track-candidate", params: valid_payload, headers: headers
        expect(recruiter.tracked_candidates.last).to eq(candidate1)
      end

      it 'returns 204 status' do 
        post "/dashboard/track-candidate", params: valid_payload, headers: headers
        expect(response).to have_http_status(204)
      end

      it 'creates the relationship in join model' do 
        expect{ post "/dashboard/track-candidate", params: valid_payload, headers: headers }.to change(CandidateTracking, :count).by(1)
      end
    end
  end

  describe 'DELETE /dashboard/untrack-candidate' do
    let!(:recruiter) { create(:user, :recruiter) }

    context 'recruiter can untrack candidate' do 
      let(:candidate1) { create(:candidate) }
      let!(:candidate2) { create(:candidate) }

      before { recruiter.tracked_candidates << candidate2 }    

      it 'successfully untracked candidate' do 
        delete "/dashboard/#{candidate2.id}/untrack-candidate", headers: headers
        expect(recruiter.tracked_candidates.reload).to be_empty
      end

      it 'returns 204 status' do 
        delete "/dashboard/#{candidate2.id}/untrack-candidate", headers: headers
        expect(response).to have_http_status(204)
      end

      it 'creates the relationship in join model' do 
        expect{ delete "/dashboard/#{candidate2.id}/untrack-candidate", headers: headers }.to change(CandidateTracking, :count).by(-1)
      end
    end
  end
end
