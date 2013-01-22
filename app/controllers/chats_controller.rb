class ChatsController < ApplicationController
	def create
		@chat = Chat.new(params[:chat])
		@chat.user_id = current_user.id
		if @chat.save
			redirect_to current_user
		else
			flash[:error] = "Problem!"
			redirect_to current_user
		end
	end

	def index
		@chats = Chat.all include: :user
		@chat = Chat.new		
	end
end
