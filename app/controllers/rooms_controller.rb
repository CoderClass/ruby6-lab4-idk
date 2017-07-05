class RoomsController < ApplicationController

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:success] = "Room #{@room.name} created!"
    else
      flash[:error] = "Error #{@room.errors.full_messages.to_sentence}"
    end
    
    redirect_to root_path
  end

  def show
    @room = Room.find(params[:id])
    
  end
  private
    def room_params
      params.require(:room).permit(:name)
    end
end
