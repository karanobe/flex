class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    # displays list of users
    # users = User.ordered_json
    # render json: users
    @user = User.all
  end

  def show
    #for user profile pages
    @user = User.find(params[:id])
    render json: @user
  end

end
