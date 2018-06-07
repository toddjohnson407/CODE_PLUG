class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :teacher]

  def home
    session[:teacher] = false
  end

  def teacher
    session[:teacher] = true
  end
end
