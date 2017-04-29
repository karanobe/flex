class GymsController < ApplicationController
  def index
    google = ENV['GOOGLE']

    render :index, locals: {google_key: google}
  end
end

