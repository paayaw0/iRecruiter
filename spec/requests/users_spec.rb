require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { build(:user) }
  let(:valid_attributes) do
    { 
      username: user.username,
      email: user.email,
      password: user.password, 
      password_confirmation: user.password
    }.to_json
  end

  let(:invalid_attributes) do 
    {
      
    }.to_json
  end

  let(:headers) { valid_headers.except('Authorizaton') }
  
  describe 'Users#create' do 
    context 'successful signup' do 
      before { post '/signup', params: valid_attributes, headers: headers }

      it 'should return auth_token' do 
        expect(json['auth_token']).not_to be_nil
      end

      it 'should return positive message' do  
        expect(json['message']).to eq('Account created successfully')
      end

      it 'return 201 status code' do 
        expect(response).to have_http_status(201)
      end
    end

    context 'unsuccessful signup' do 
      before { post '/signup', params: invalid_attributes, headers: headers }

      it 'should return no auth_token' do 
        expect(json['auth_token']).to be_nil
      end

      it 'should return positive message' do  
        expect(json['message']).to eq("Validation failed: Password can't be blank, Username can't be blank, Email can't be blank, Password digest can't be blank")
      end

      it 'return 201 status code' do 
        expect(response).to have_http_status(422)
      end
    end
  end
end
