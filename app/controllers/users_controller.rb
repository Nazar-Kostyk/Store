class UsersController < Clearance::UsersController

  def cabinet
    @user = current_user 
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
