class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  def dashboard
    @bookings = current_user.bookings
    @events = current_user.events
  end

  def show
    @bookings = current_user.bookings
    @events = current_user.events
  end

  def edit

  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :description, :photo)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
