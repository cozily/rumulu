class WelcomeController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    redirect_to rooms_path and return if user_signed_in?
  end
end
