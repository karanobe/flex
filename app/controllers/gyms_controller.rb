class GymsController < ApplicationController
  def index
    gyms = current_user.gyms
    render json: gyms
  end

  def new
    google = ENV['GOOGLE']
    render :index, locals: {google_key: google}
  end
end

