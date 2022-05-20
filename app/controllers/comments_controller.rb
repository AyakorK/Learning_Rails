# frozen_string_literal: true

# Comments Controller
class CommentsController < ApplicationController
  def create
    redirect_to '/users', status: 302 and return if current_user.blank?

    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    if belongs_to_user?
      if @comment.save
        flash[:notice] = 'Comment created successfully'
        redirect_to article_path(@article), status: 200 and return
      else
        flash[:alert] = @comment.errors.full_messages.to_sentence
        redirect_to article_path(@article), status: 422 and return
      end
    else
      flash[:alert] = "You can't comment on this article with an other account than yours"
      redirect_to article_path(@article), status: 404
    end
  end

  def destroy
    redirect_to '/users', status: 302 and return if current_user.blank? || (current_user && current_user.id != Comment.find(params[:id]).user_id)

    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: 200
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :stars, :status, :user_id)
  end

  def belongs_to_user?
    @comment.user_id == current_user.id
  end
end
