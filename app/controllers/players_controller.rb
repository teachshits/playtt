class PlayersController < ApplicationController
def index
    @players = Player.all(:order => :last_name)
  end

  def show
    @player = Player.find_by_id(params[:id])    
  end

  # def new
  #   @player = Player.new
  # end

  # def create
  #   @player=Player.new(params[:player])
  #   if @player.save
  #     session[:user_id]=@player.id
  #     redirect_to  @player
  #   else
  #     flash.now[:errors]= @player.errors.full_messages
  #     render 'new'
  #   end
  # end
end
