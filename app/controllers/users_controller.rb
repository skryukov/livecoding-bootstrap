class UsersController < ApplicationController
  def index
    users = User.all
    render json: {users:}
  end

  def show
    user = User.find(params[:id])
    render json: {user:}
  end

  def create
    # TODO: create registration action
  end
end
