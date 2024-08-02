class ArticlesController < ApplicationController
  before_action :get_id,only: [:edit,:update,:show,:destroy]
  def show
  end
  def index
    @articles = Article.all
  end
  def new
    @article = Article.new
  end
  def edit
  end
  def create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article
    else
      render 'new'
    end
  end
  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'edit'
    end
  end
  #the earlier version was not working because i had set destroy as destory othewise they are fine and will be working
  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private #don't add methods that you want to use outside the controller as that won't work

  def get_id
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
