class GymsController < ApplicationController
  def index
    gyms = current_user.gyms
    render json: gyms
  end

  def new
    google_key = ENV['GOOGLE']
    @gym = Gym.new
    render :new, locals: {google_key: google_key}

  end

  def create
    p params
    @gym = Gym.new(name: gym_params[:name], street_address: gym_params[:street_address], city: gym_params[:city], state: gym_params[:state], zip: gym_params[:zip], user_id: current_user.id)
    if @gym.save
      redirect_to root_path
    else
      redirect_to gyms_path(@gym)
    end
  end

  def show
    gym = Gym.find(params[:id])
    render json:gym
  end

  private
  def gym_params
    params.require(:gym).permit(:name, :street_address, :city, :state, :zip)
  end
end

