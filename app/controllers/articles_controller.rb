class ArticlesController < ApplicationController
  def index
    @articles = ArticleDecorator.decorate(Article.published.page(params[:page]).per(10))
  end

  def show
    @article = ArticleDecorator.decorate(Article.where(slug: params[:id]))
  end
end
