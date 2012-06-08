class ArticlesController < ApplicationController
  def index
    @articles = ArticleDecorator.decorate(Article.published.limit(10).page(params[:page]).per(10))
  end
end
