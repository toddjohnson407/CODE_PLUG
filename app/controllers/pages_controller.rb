class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :teacher]
  protect_from_forgery :except => [:user_location]
  layout 'footer'

  def home
    session[:teacher] = false
  end

  def teacher
    session[:teacher] = true
  end

  def user_location

    lat = params["lat"]
    long = params["lng"]

    location = lat.to_s + "-" + long.to_s

    if current_user
      current_user.location = location
      current_user.save
    end


  end
end
