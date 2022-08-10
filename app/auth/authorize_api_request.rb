class AuthorizeApiRequest
  def initialize(headers)
    @headers = headers
  end

  def call
    {
      user: user
    }
  end

  private

  attr_reader :headers

  def user
    user ||= User.find(decode_authorization_headers[:user_id])
  rescue ActiveRecord::RecordNotFound
    raise ExceptionHandler::InvalidToken, 'Invalid Token'
  end

  def decode_authorization_headers
    @decode_authorization_headers ||= JsonWebToken.decode(authorization_headers) if authorization_headers
  end

  def authorization_headers
    return headers['Authorization'].split(' ').last if headers['Authorization'].present?

    raise ExceptionHandler::MissingToken, 'Missing Token'
  end
end
