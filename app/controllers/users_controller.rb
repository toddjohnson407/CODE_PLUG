class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
  end


private
  def course_params
    params.require(:users).permit(:first_name)
  end
end