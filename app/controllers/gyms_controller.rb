class GymsController < ApplicationController
  def index
    @gyms = current_user.gyms
    render json: {gymsInfo: render_to_string('gyms/index', layout: false, locals: {gyms: @gyms})}
    # render json: gyms
  end

  def new
    p @google_key = ENV['GOOGLE']
    render :new, layout: false, locals: {google_key: @google_key}
  end

  def show
    gym = Gym.find(params[:id])
    render json:gym
  end

  def create
    gym = Gym.new(gym_params)
    if gym.save
        current_user.set_primary_false
      Membership.create(user_id: current_user.id, gym_id: gym.id, primary_gym: true)
      @gyms = current_user.gyms
      render json: {gymsInfo: render_to_string('gyms/index', layout: false, locals: {gyms: @gyms})}
    end
  end

  def set_primary
    gym = Gym.find(params[:id])
    current_user.set_primary_on_click(gym)
    @gyms = current_user.gyms
    render json: {gymsInfo: render_to_string('gyms/index', layout: false, locals: {gyms: @gyms})}
  end

  def gym_params
    params.require(:gym).permit(:id, :name, :street_address, :city, :state, :zip)
  end
end

