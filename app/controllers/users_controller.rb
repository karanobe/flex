class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    users = User.ordered_json
    render json: users
  end

end
