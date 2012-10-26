class PlacesController < ApplicationController
  before_filter :authenticate_player!,  except: [:index, :show]
  def index
    @places = Place.all(:order => :city)
  end

  def new
    @place = Place.new    
  end

  def create
      place=Place.new(params[:place])
     if place.save
       redirect_to  place
     else
       flash.now[:errors]= place.errors.full_messages
       render 'new'
     end
  end

  def show
    @places ||= Place.all(:order => :city)
    @current_place = Place.find_by_id(params[:id])
  end
end
