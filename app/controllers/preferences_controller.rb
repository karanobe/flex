class PreferencesController < ApplicationController
  def new
    @pref = Preference.new
  end

  def create
    p params
    @pref = Preference.new(age_range: pref_params[:age_range], gender: pref_params[:gender], user_id: current_user.id)
    p @pref
    if @pref.save
      redirect_to users_path
    else
      redirect_to new_preferences_path(@pref)
    end
  end

  def pref_params
    params.require("Save Preferences").permit(:age_range, :gender)
  end
end
