class UserController < ApplicationController
  before_action :authenticate_user!

  def index
    current
  end
end
