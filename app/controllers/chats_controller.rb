class ChatsController < ApplicationController
	def create
		@chat = Chat.new(params[:chat])
		@chat.userid = current_user.id
		if @chat.save
			redirect_to current_user
		else
			flash[:error] = "Problem!"
			redirect_to current_user
		end
	end
end
