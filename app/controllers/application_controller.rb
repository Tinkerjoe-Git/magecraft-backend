class ApplicationController < ActionController::API
  include ExceptionHandler
  def issue_token(payload)
    JWT.encode(payload, ENV["JWT_SECRET"])
  end

  # def decode_token
  #   JWT.decode(get_token, ENV["JWT_SECRET"])[0]
  # end



  def current_user
    JsonWebToken.decode(@token)[:user_id] if @token
  end

  def get_token
    request.headers["Authorization"]
  end
end

