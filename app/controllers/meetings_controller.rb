class MeetingsController < ApplicationController
  before_filter :authenticate_player!,  except: [:index, :show, :city]
  #only: [:new, :edit, :update]
  include MeetingsHelper

  def index
    @meeting = current_player.meetings.new if player_signed_in?
    @meetings = Meeting.hot.limit(20).
    where('end_at > ?', DateTime.now).
    order('start_at') 
  end

  def new
    @meeting = Meeting.new
    @places = Place.all.map { |el| ["#{el.city} #{el.name}", el.id] }
  end

  def create
    params[:meeting][:level]=current_player.level
    @meeting=current_player.meetings.create(params[:meeting])
    if @meeting.save
       flash[:success] = t(:new_meeting_created)
       redirect_to meetings_path
    else
      flash.now[:errors] = @meeting.errors.full_messages
      @places = Place.all.map { |el| ["#{el.city} #{el.name}", el.id] }
      render 'new'
    end
  end

  def show
    @meeting = Meeting.find_by_id(params[:id])
  end

  def city
    @meeting = current_player.meetings.new if player_signed_in?
    @meetings = Meeting.in_city(params[:name]).order('start_at')
  end
  #TODO: переадрисация на предыдущую старницу
  def enroll
    event = Meeting.find_by_id(params[:id])
    current_player.meetings.push(event) if !is_involved(params[:id])
    redirect_to request.referer  #city_meetings_path(:name=> event.place.city)  
  end

  def leave
    event = Meeting.find_by_id(params[:id])
    event.players.delete(current_player) if is_involved(params[:id])
    if event.players_count == 0
      event.delete
      redirect_to meetings_path #city_meetings_path(:name=> event.place.city)
    else
      redirect_to request.referer
    end      
  end

end
