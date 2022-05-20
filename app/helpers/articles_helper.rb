# frozen_string_literal: true

# Articles Helper
module ArticlesHelper
  def h1_title
    content_tag :h1, 'Articles'
  end

  def get_user_email(user_id)
    user = User.find(user_id)
    user.email
  end

  def can_user_comment?(user_id, article_id)
    user = User.find(user_id)
    article = Article.find(article_id)
    false if user.comments.where(article_id: article.id).any?
  end
end
