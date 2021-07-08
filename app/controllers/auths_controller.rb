  
class AuthsController < ApplicationController
  def create
    if @user = User.find_by_name(params[:user][:name])
      if @user.valid? == 'true'
        @user = current_user
        jwt = user.generate_jwt
        render json: {user: UserSerializer.new(@user).serializable_hash, jwt: jwt}
      else
        render json: {error: {message: "Invalid password"}}
      end
    else
      render json: {error: {message: "Username not found"}}
    end
  end

  def show
    if current_user
      render json: current_user
    else
      render json: {error: {message: "Not logged in"}}
    end
  end
end
