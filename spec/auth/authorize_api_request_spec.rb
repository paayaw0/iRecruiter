require 'rails_helper'

RSpec.describe AuthorizeApiRequest do
  let(:user) { create(:user) }
  let(:headers) do
    {
      'Authorization' => token_generator(user.id)
    }
  end

  let(:valid_request_obj) { described_class.new(headers) }
  let(:invalid_request_obj) { described_class.new({}) }

  context 'when request is valid' do
    it 'should return user' do
      expect(valid_request_obj.call[:user]).to eq(user)
    end
  end

  context 'when request' do
    context 'has missing token' do
      it 'raise invalid token error' do
        expect { invalid_request_obj.call }.to raise_error(ExceptionHandler::MissingToken, 'Missing Token')
      end
    end

    context 'has fake token' do
      let(:headers) { { 'Authorization' => 'foobar' } }
      subject(:invalid_request_obj) { described_class.new(headers) }

      it 'raise invalid token error' do
        expect do
          invalid_request_obj.call
        end.to raise_error(ExceptionHandler::InvalidToken, 'Not enough or too many segments')
      end
    end

    context 'has invalid token from another user' do
      let(:headers) { { 'Authorization' => token_generator(5) } }
      subject(:invalid_request_obj) { described_class.new(headers) }

      it 'raise invalid token error' do
        expect { invalid_request_obj.call }.to raise_error(ExceptionHandler::InvalidToken, 'Invalid Token')
      end
    end

    context 'has expired token' do
      let(:headers) { { 'Authorization' => expired_token_generator(user.id) } }
      subject(:invalid_request_obj) { described_class.new(headers) }

      it 'raises invalid token' do
        expect { invalid_request_obj.call }.to raise_error(ExceptionHandler::InvalidToken, 'Signature has expired')
      end
    end
  end
end
