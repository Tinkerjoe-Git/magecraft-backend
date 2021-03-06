class ApplicationController < ActionController::API
  respond_to :json
  # wrap_parameters format: [:json]

  # before_action :authenticate_user!

  def issue_token(payload)
    JWT.encode(payload, Rails.application.credentials.devise[:jwt_secret_key])
  end

  def decode_token
    JWT.decode(get_token, Rails.application.credentials.devise[:jwt_secret_key])[0]
  end

  def current_user
    decoded_hash = decode_token
    @user = User.find(decoded_hash["user_id"])
    UserSerializer.new(@user).serializable_hash
  end

  def get_token
    request.headers["Authorization"]
  end




  def authenticate_user
    if request.headers['Authorization'].present?
      authenticate_or_request_with_http_token do |token|
        begin
          jwt_payload = JWT.decode(token, Rails.application.credentials.devise[:jwt_secret_key]).first

          @current_user_id = jwt_payload['id']
        rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
          head :unauthorized
        end
      end
    end
  end


  def authenticate_user!(options = {})
    head :unauthorized unless signed_in?
  end

  # def current_user
  #   @current_user ||= super || User.find_by(id: params[:user_id]) || @current_user_id
  # end

  def signed_in?
    @current_user_id.present?
  end



  private

  # # Check for auth headers - if present, decode or send unauthorized response (called always to allow current_user)
  # def process_token
  #   if request.headers['Authorization'].present?
  #     begin
  #       # jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.secrets.secret_key_base).first
  #       jwt_payload = JWT.decode(request.headers['Authorization'][0]
  #       current_user_id = jwt_payload['id']
  #     rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
  #       head :unauthorized
  #     end
  #   end
  # end

  # # If user has not signed in, return unauthorized response (called only when auth is needed)
  # def authenticate_user!(options = {})
  #   head :unauthorized unless signed_in?
  # end

  # # set Devise's current_user using decoded JWT instead of session
  # def current_user
  #   @current_user ||= super || User.find(@current_user_id)
  #   @current_user = @user
  #   UserSerializer.new(@user).serializable_hash
  # end

  # # check that authenticate_user has successfully returned @current_user_id (user is authenticated)
  # def signed_in?
  #   @current_user_id.present?
  # end
end


