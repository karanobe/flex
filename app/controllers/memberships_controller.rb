class MembershipsController < ApplicationController


  def membership_params
    params.require(:membership).permit(:id)
  end
end
