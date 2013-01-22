class UsersController < ApplicationController

def new
	if current_user
		redirect_to buddies_path
	else
		@user = User.new
	end
end

def index
	@users = User.all
end

def buddies
	if current_user
		@chat = Chat.new
		buddies_ids = current_user.followeds.map(&:id).push(current_user.id)
		@chats = Chat.find_all_by_user_id buddies_ids
	else
		redirect_to user
	end
end

def create
	@user =User.new(params[:user])
	if @user.save
		session[:user_id] = @user.id
		redirect_to @user, notice: "Thank you for signing up for Chatter"
	else
		render 'new'
	end
end

def show
	@user = User.find(params[:id])
	@chat = Chat.new
	@relationship = Relationship.where(
    follower_id: current_user.id,
    followed_id: @user.id
	).first_or_initialize if current_user
end

end
