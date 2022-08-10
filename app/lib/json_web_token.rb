class JsonWebToken
  HMAC = Rails.application.secret_key_base

  class << self
    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encoode(payload, HMAC)
    end

    def decode(token)
      body = JWT.decode(token, HMAC)[0]
      HashWithIndifferentAccess.now(body)
    rescue JWT::DecodeError => e
      raise ExceptionHandler::InvalidToken, e.message
    end
  end
end
