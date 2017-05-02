class GymsController < ApplicationController
  def index
    gyms = current_user.gyms
    render json: gyms
  end

  def new
    google_key = ENV['GOOGLE']
    # render :new, locals: {google_key: google}
    render json: {newGymForm: render_to_string("gyms/new", :layout => false, locals: {google_key: google_key})}
  end


  # need to add create route to save new gym from form submitted"

  def show
    gym = Gym.find(params[:id])
    render json:gym
  end
end

