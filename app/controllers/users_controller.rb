class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end
  def create
    @user = User.new(user_params)
    if @user.save
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
    @user = User.find(params[:id])
    @articles = @user.articles.paginate(page: params[:page], per_page: 2)
  end

  def update
    @user = User.find(params[:id])
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
end
