class GymsController < ApplicationController
  def index
    @google_key = ENV['GOOGLE']
  end
end

