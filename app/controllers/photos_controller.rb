class PhotosController < ApplicationController

  before_action :set_photo, only: [:show, :edit, :update, :destroy, :positive, :negative, :star]

  # GET /photos
  # GET /photos.json
  def index
    @search = Photo.search(params[:q])
    @photos = @search.result
    #@photos = current_user.photos
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end



  def all
    # binding.pry
    @photo = Photo.all
    # redirect_to (photos_path)
  end


  def search
    @search = Photo.search(params[:q])
    @photos = @search.result
  end
  





  # POST /photos
  # POST /photos.json
  # def create
  #   @photo = Photo.new(photo_params)
  #   @photo.user_id = current_user.id
  #   respond_to do |format|
  #     if @photo.save
  #       format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
  #       format.json { render :show, status: :created, location: @photo }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @photo.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    if @photo = current_user.photos.create(photo_params)
			flash[:success] = "photo updated."
			redirect_to(photo_path(@photo))
		else
      flash.now[:alert] = "Update failed.  Please check the form."
      render :edit
		end
  end


  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Positive votes
  def positive
    @photo.upvote_by current_user
    redirect_to(photos_path)
  end

  # Negative votes
  def negative
    @photo.downvote_from current_user
    redirect_to(photos_path)
  end

  def star
    @photo.vote_by :voter => current_user, :vote => 'like', :vote_scope => 'rank', :vote_weight => params[:rating].to_i
    redirect_to(photos_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:caption, :avatar)
    end
end
