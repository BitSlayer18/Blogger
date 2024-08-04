class UsersController < ApplicationController
  before_action :set_user,only: [:show,:edit,:update]
  before_action :require_user,only: [:edit,:update]
  before_action :is_same_user,only: [:edit,:update]
  def new
    @user = User.new
  end

  def edit
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "new User Created Succesfully"
      redirect_to articles_path
    else
      render :new,status: :unprocessable_entity
    end
  end
  def index
    @users = User.paginate(page: params[:page], per_page: 2)
  end
  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 2)
  end

  def update
    if @user.save
      flash[:notice] = "User details were updated succesfully"
      redirect_to @user
    else
      render :edit,status: :unprocessable_entity
    end

  end

  private
  def user_params
    params.require(:user).permit(:username,:email,:password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def is_same_user
    if @user != current_user
      flash[:alert] = "You can edit your own profile only"
      redirect_to @user
    end
  end
end
