class CurrentUserController < ApplicationController
  # before_action :authenticate_user!
  def index
    render json: current_user, status: :ok
  end

  def show
    if current_user
      render json: current_user, status: :ok
    else
      render json: {error: {message: "Not logged in"}}
    end
  end
end