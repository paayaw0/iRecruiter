require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  let(:user) { create(:user) }
  let(:valid_attributes) do
    {
      email: user.email,
      password: user.password
    }.to_json
  end

  let(:invalid_attributes) do
    {
      email: Faker::Internet.email,
      password: Faker::Internet.password
    }.to_json
  end

  let(:headers) { valid_headers.except('Authorization') }

  describe 'Authentication#authenticate' do
    context 'successful authentication' do
      before { post '/auth/login', params: valid_attributes, headers: headers }

      it 'yields auth token for valid user' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'unsuccessful authentication' do
      before { post '/auth/login', params: invalid_attributes, headers: headers }

      it 'raises error' do
        expect(json['message']).to eq('Invalid Credentials')
      end

      it 'no auth_token is present' do
        expect(json['auth_token']).to be_nil
      end
    end
  end
end
