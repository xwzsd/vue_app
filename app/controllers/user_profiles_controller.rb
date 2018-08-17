class UserProfilesController < ApplicationController
  def edit
    user = User.find_by(id: params[:id])
    @user_profile = user.user_profile
  end

  def update
    user_profile = UserProfile.find(user_profile_params[:id])
    if user_profile.update_attributes(user_profile_params)
      redirect_to root_path, notice: 'Successful'
    else
      render 'edit'
    end
  end

  private
    def user_profile_params
      params.require(:user_profile).permit(:id, :name, :surname, :city)
    end
end
