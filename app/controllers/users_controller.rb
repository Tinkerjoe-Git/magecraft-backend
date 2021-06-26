class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users

  def login
    auth_object = Authentication.new(login_params)
    if auth_object.authenticate
      render json: {
        message: "Login successful!", token: auth_object.generate_token }, status: :ok
    else
      render json: {
        message: "Incorrect username/password combination"}, status: :unauthorized
    end
  end

  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      jwt = issue_token({user_id: @user.id})
      render json: {user: UserSerializer.new(@user).serializable_hash, jwt: jwt}
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.

    def login_params
      params.permit(:username, :password)
    end
    
    def user_params
      params.require(:user).permit(:username, :password_digest)
    end
end
