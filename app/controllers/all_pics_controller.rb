class AllPicsController < ApplicationController
  def index
    @photos = current_user.photos
  end
end
