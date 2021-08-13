class AlbumsController < ApplicationController
  # before_action :logged_in_user, only: [:create, :destroy]
  before_action :find_album, except: [:new, :index, :create]

  def index
    @albums = current_user.albums
  end

  def new
    @album = Album.new
    @pictures = @album.pictures.build
    
  end

  def create
    @album = current_user.albums.build(album_params)
    if @album.save
      params[:pictures]['avatar'].each_with_index do |a, index|
        if index < 10 # Only allow max 10 pictures per Album
          @picture = @album.pictures.create!(:avatar => a)
        end
      end
      flash[:success] = "Album created!"
      redirect_to root_url
    end
  end

  def destroy
    @album.destroy
    flash[:success] = "Album deleted"
    redirect_to root_url
  end

  private

    def album_params
      pp = params.require(:album).permit(:name, :user_id, pictures_attributes: [:id, :album_id, :avatar])
      pp[:privacy] = params[:album][:privacy].to_i
      return pp
    end

    def find_album
      @album = Album.find params[:id]
    end
end
