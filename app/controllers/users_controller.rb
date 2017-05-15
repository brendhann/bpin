class UsersController < ApplicationController
  def show
  @user = User.find_by_id(params[:id])
  @pins = @user.pins
  end

  def pins
  	@user = User.find(params[:id])
  	@pins = @user.pins
  end

def user_params
  params.require(:user).permit(:avatar)
end
end
