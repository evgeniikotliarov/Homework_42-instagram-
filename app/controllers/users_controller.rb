class UsersController < ApplicationController

	before_action :signed_in?,
			only: [:index, :edit, :update, :destroy, :following, :followers]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to user_path(@user)
		else
			render 'new'
		end
	end

	def index
		@users = User.order(created_at: :desc).limit(5)
	end
	def show
		@user = User.find(params[:id])
		@instaposts = @user.instaposts.paginate(page: params[:page])
	end
	def destroy
		User.destroy(params[:id])
		redirect_to user_path
	end

	def following
		@name = "Following"
		@user = User.find(params[:id])
		@users = @user.followed_users.paginate(page: params[:page])
		render 'show_follow'
	end	

	def followers
		@name = "Followers"
		@user = User.find(params[:id])
		@users = @user.followers.paginate(page: params[:page])
		render 'show_follow'
	end	

	private
	def user_params
		params.require(:user).permit(:name, :user_id, :image)
	end

end
