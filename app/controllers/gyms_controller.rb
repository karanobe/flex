class GymsController < ApplicationController
  def index
    gyms = current_user.gyms
    render json: gyms
  end

  def new
    google_key = ENV['GOOGLE']
    render :new, layout: false, locals: {google_key: google_key}
  end

  def show
    gym = Gym.find(params[:id])
    render json:gym
  end

  def create
    gym = Gym.new(gym_params)
    if gym.save
      current_user.set_primary_on_add_new
      Membership.create(user_id: current_user.id, gym_id: gym.id, primary_gym: true)
      render nothing: true
    end
  end

  def gym_params
    params.require(:gym).permit(:name, :street_address, :city, :state, :zip)
  end
end

