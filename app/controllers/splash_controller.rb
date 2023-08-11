class SplashController < ApplicationController
  def index
    if user_signed_in?
      redirect_to categories_path
    else
      redirect_to root_path
    end
  end
end
