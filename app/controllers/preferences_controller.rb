class PreferencesController < ApplicationController
  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.new(age_range: pref_params[:age_range], gender: pref_params[:gender], user_id: current_user.id)
    if @preference.save
      redirect_to users_path
    else
      redirect_to preferences_path(@preference)
    end
  end

  def edit
    @preference = Preference.find_by(user_id: current_user.id)
  end

  def update
    @preference = Preference.find_by(user_id: current_user.id)
    if @preference.update(pref_params)
      redirect_to users_path
    else
      redirect_to preferences_path(@preference)
    end
  end

  def pref_params
    params.require(:preference).permit(:age_range, :gender)
  end
end
