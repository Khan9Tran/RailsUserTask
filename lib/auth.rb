# lib/auth.rb
require 'jwt'
class Auth
  ALGORITHM = 'HS256'
  def self.issue(payload)
    JWT.encode(
      payload,
      auth_secret,
      ALGORITHM)
  end
  def self.decode(token)
    JWT.decode(token,
      auth_secret,
      true,
      { algorithm: ALGORITHM }).first
  end
  def self.auth_secret
    ENV["AUTH_SECRET"]
  end

  def self.email_comfimation_token(user_id)
    payload = { user_id: user_id, expired: (Time.now + 600).to_i }
    issue(payload)
  end
end
