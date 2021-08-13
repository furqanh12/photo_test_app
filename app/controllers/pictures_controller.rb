class PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_album, only: [:index]

  def new
    @picture = Picture.new
  end

  def create
    if Picture.create(picture_params)
      flash[:success] = "Album created!"
      redirect_to root_url
    end
  end

  def index
    @pictures = @album.pictures
  end

  private

    def picture_params
      params.require(:picture).permit(:avatar)
    end

    def find_album
      @album = Album.find params[:album_id]
      if @album.present? && @album.private_view?
        flash[:alert] = 'Cannot view a private Album'
        redirect_to root_url
      end
    end
end
