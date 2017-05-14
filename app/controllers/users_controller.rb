class UsersController < ApplicationController
  def index
  end
  def show
  @user = User.find_by_id(params[:id])
end

def user_params
  params.require(:user).permit(:avatar)
end
end
