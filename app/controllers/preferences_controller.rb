class PreferencesController < ApplicationController
  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.new(min_age: pref_params[:min_age], max_age: pref_params[:max_age], gender: pref_params[:gender], user_id: current_user.id)
    if @preference.save
      redirect_to users_path
    else
      redirect_to preferences_path(@preference)
    end
  end

  def edit
    @preference = Preference.find(params[:id])
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
    params.require(:preference).permit(:min_age, :max_age, :gender)
  end
end
