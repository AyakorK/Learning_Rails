# frozen_string_literal: true

# Articles Controller
class ArticlesController < ApplicationController
  helper_method :articles_count

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    redirect_to '/users' if current_user.nil?
    @article = Article.new
  end

  def create
    redirect_to '/users', status: 302 and return if current_user.blank?

    @article = Article.new(article_params)
    if belongs_to_user?
      redirect_to articles_path, status: 302 and return if @article.save

      render :new, status: :unprocessable_entity
    else
      render :new, status: 404
    end
  end

  def edit
    redirect_to '/users' if current_user.id.nil?
    @article = Article.find(params[:id])
  end

  def update
    redirect_to '/users' if current_user.id.nil?
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to articles_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    redirect_to '/users', status: 302 and return if current_user.blank?

    @article = Article.find(params[:id])
    if belongs_to_user?
      redirect_to articles_path, status: 302 and return if @article.destroy
    else
      render :new, status: 404
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status, :user_id)
  end

  def articles_count
    @articles_count = Article.open_count
  end

  def belongs_to_user?
    @article.user_id == current_user.id
  end
end
