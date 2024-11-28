class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @events = Event.all
    if current_user && current_user.is_teacher?
      @events = Event.where(user: current_user)
    end
  end
end
