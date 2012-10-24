class ApplicationController < ActionController::Base
  protect_from_forgery
  include Styx::Initializer

  def authenticate_admin_user!
    authenticate_player!
    redirect_to root_path unless current_player.try(:admin?)
  end

end
