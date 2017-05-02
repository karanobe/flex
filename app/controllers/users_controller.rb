class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    # displays list of users
    gym_goers = current_user.ordered_json
    render json: gym_goers
  end

  def profile_load
    @user = current_user
    render json: {picUpload: render_to_string("users/profile", layout: false, locals: {user: @user})}
  end

  def show
    @user = User.find(params[:id])
    if request.xhr?
      render json: {userInfo: render_to_string("users/show", :layout => false, locals: {user: @user})}
    else
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(avatar: picture_params[:avatar])
    redirect_to user_path(current_user)
  end

  private

  def picture_params
    params.require(:user).permit(:avatar)
  end
end
