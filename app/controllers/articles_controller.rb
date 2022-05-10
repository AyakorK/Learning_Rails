class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    redirect_to articles_path if @article.save
    render :new, status: :unprocessable_entity
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    redirect_to articles_path if @article.update(article_params)
    render :edit, status: :unprocessable_entity
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    # Alert that it has been deleted


    redirect_to articles_path, status: :see_other
  end

  private
  def article_params
    params.require(:article).permit(:user_id, :title, :body, :status)
  end
end
