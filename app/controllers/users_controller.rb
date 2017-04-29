class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @users = User.all
  end

end
