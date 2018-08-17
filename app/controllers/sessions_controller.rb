class SessionsController < Devise::SessionsController

  def create
    user = User.find_by(email: auth_params[:email])
    if user
      jwt = Auth.issue({user: user.id})
      sign_in(user)
      respond_to do |format|
        format.html { redirect_to edit_user_profile_path(user.id), notice: 'Login Successful' }
        format.json { render jwt: jwt }
      end
    else
      redirect_to new_user_session_path, notice: 'Something went wrong'
    end
  end

  private
    def auth_params
      params.require(:user).permit(:email, :password, :remember_me)
    end
end
