class FriendshipsController < ApplicationController

  def create
    @user = User.find(params[:format])
    Friendship.create(user_id: current_user.id,
     friend_id: @user.id, status: "Request Sent")
    render json: {friendInfo: render_to_string("users/_friends", :layout => false, locals: {user: @user})}
  end

  def accept
    @user = User.find(params[:id])
    confirm = Friendship.find_by(user_id: @user.id, friend_id: helpers.current_user.id)
    confirm.update_attributes(status: "Accepted")
    Friendship.create(user_id: helpers.current_user.id, friend_id: @user.id, status: "Accepted")

    redirect_to @user
  end

  def deny
    @user = User.find(params[:id])
    Friendship.find_by(user_id: params[:id], friend_id: helpers.current_user.id).destroy

    redirect_to @user
  end

  def destroy
    @user = User.find(params[:id])
    Friendship.find_by(user_id: helpers.current_user.id, friend_id: params[:id]).destroy

    redirect_to @user
  end
end
