class PreferencesController < ApplicationController
  def new
    @preference = Preference.new
    render json: {newPrefForm: render_to_string("preferences/new", :layout => false, :locals => { :preference => @preference })}
  end

  def create
    @preference = Preference.new(min_age: pref_params[:min_age], max_age: pref_params[:max_age], gender: pref_params[:gender], user_id: current_user.id)
    if @preference.save
      redirect_to root_path
    else
      redirect_to preferences_path(@preference)
    end
  end

  def edit
    @preference = Preference.find(params[:id])
    render json: {editPrefForm: render_to_string("preferences/edit", :layout => false, :locals => { :preference => @preference })}
  end

  def update
    @preference = Preference.find_by(user_id: current_user.id)
    if @preference.update(pref_params)
      redirect_to root_path
    else
      redirect_to preferences_path(@preference)
    end
  end

  private
  def pref_params
    params.require(:preference).permit(:min_age, :max_age, :gender)
  end
end
