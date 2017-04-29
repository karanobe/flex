class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @user = current_user
    users = User.ordered_json
    # render json: users
  end

end
