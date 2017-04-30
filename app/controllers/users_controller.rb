class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    # displays list of users
    gym_goers = current_user.ordered_json
    render json: gym_goers
  end

  def show
    #for user profile pages
    # p params
    @user = User.find(params[:id])
    render json: @user
  end

end
