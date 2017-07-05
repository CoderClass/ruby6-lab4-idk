class MessagesController < ApplicationController
	def create
		@room = Room.find(params[:room_id])
		@message = @room.messages.build(message_params)

		if @message.save
			flash[:success] = "Create message successful"
		else
			flash[:error] = "Cannot create message"
		end

		redirect_to @room
	end

	def index
		@room = Room.find(params[:room_id])
		@messages = Message.all 
	end
	private

	def message_params
		params.require(:message).permit(:username, :content)
	end
end
