class UsersController < ApplicationController
  def dashboard

  end

  def show
    @user = User.find(params[:id])
  end

  def update

  end
end
