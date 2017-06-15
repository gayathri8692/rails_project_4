class PhotoController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
	before_action :authenticate_user!, except: [:index, :allpics, :week, :month, :show]

  def index	
		@photos = Photo.all.where(created_at:(Time.now - 1.day)..Time.now)
	end


	def allpics
		@photos = Photo.all
	end

	def week
		@photos = Photo.all.where(created_at:(Time.now - 7.day)..Time.now)
	end

	def month
		@photos = Photo.all.where(created_at:(Time.now - 31.day)..Time.now)
	end

  def show
		@photo = Photo.find(params[:id])
		@random_photo = Photo.where.not(id: @photo).order("RANDOM()").first
	end

  def new
		@photo = current_user.photos.build
	end

	def create
		@photo = current_user.photos.build(photo_params)

		if @photo.save
			redirect_to @photo
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @photo.update(photo_params)
			redirect_to @photo_params
		else
			render 'edit'
		end
	end

	def destroy
		@photo.destroy
		redirect_to root_path
	end


  private

	def find_photo
		@photo = Photo.find(params[:id])
	end
	# strong parameters
	def photo_params
		params.require(:photo).permit(:img)
	end




end
