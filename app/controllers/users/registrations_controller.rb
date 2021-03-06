# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  # before_action :configure_sign_up_params, only: [:create, :new]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # # POST /resource
  # def create
  #   super
  # end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      jwt = issue_token({user_id: @user.id})
      render json: {user: UserSerializer.new(@user).serializable_hash, jwt: jwt}
    end
  end



  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  private

  # def respond_with(resource, _opts = {})
  #   if resource.persisted?
  #     render json: {
  #       status: {code: 200, message: 'Signed up sucessfully.'},
  #       data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
  #     }
  #   else
  #     render json: {
  #       status: {message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}"}
  #     }, status: :unprocessable_entity
  #   end
  # end

  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute, :name, :email, :password])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
