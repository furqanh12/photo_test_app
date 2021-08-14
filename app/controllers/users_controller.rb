class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user_by_name, only: :show
  before_action :find_user,  only: [:follow, :unfollow, :followers, :following]


  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @current_user = current_user
    @albums = @user.albums.public_view
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def follow
    current_user.followees << @user
    redirect_back(fallback_location: user_path(@user))
  end

  def unfollow
    current_user.followed_users.find_by(followee_id: @user.id).destroy
    redirect_back(fallback_location: user_path(@user))
  end

  def followers
    @users = @user.followers
    @follow_text = "Following"
    render 'users_list'
  end

  def following
    @users = @user.followees
    @follow_text = "Followers"
    render 'users_list'
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # Before filters

    # Confirms the correct user.
    def find_user
      @user = User.find(params[:id])
    end

    def load_user_by_name
      @user = User.find_by_profile_url params[:name]
    end
end
