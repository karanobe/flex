class GymsController < ApplicationController
  def index
    gyms = current_user.gyms
    render json: gyms
  end

  def new
    google = ENV['GOOGLE']
    render :new, locals: {google_key: google}
  end

  def show
    gym = Gym.find(params[:id])
    render json:gym
  end
end

