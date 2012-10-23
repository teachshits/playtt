class ApplicationController < ActionController::Base
  protect_from_forgery
  include Styx::Initializer

def authenticate_admin_user!
  redirect_to root_path unless current_player.admin?
end
  
end
