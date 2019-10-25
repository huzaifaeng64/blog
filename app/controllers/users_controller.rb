class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def logout
	end

	def index
		@users = User.all
	end

	def destroy
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def photos
		@users = User.all
	end

	def create
		@user = User.new(params.require(:user).permit(:name, :image, :image_cache, :remove_image))
		if @user.save
			redirect_to @user
		else
			render 'new'
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(params.require(:user).permit(:name, :image, :image_cache, :remove_image))
			@user.remove_image!
			redirect_to @user
		else
			render 'edit'
		end
	end


end
