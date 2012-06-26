class ArticleDecorator < Draper::Base
  decorates :article

  def published_date
    article.published_at.to_s(:long_date)
  end

  def abstract_or_content(id = nil)
    id ? article.content : article.abstract
  end
end
