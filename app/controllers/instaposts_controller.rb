class InstapostsController < ApplicationController

	def new
		@instapost = Instapost.new
	end

	def create
		@instapost = Instapost.new(instapost_params)
		if @instapost.save
			redirect_to instapost_path(@instapost)
		else
			render 'new'
		end
	end

	def index
		@instaposts = Instapost.order(created_at: :desc).limit(10)
	end
	def show
		@instapost = Instapost.find(params[:id])
	end
	def destroy
		Instapost.destroy(params[:id])
		redirect_to instapost_path
	end
	private
	def instapost_params
		params.require(:instapost).permit(:content, :user_id, :image)
	end
  
end
