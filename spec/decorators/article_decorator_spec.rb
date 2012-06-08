require 'spec_helper'

describe ArticleDecorator do
  let(:article)           { double('Article', published_at: Time.now) }
  let(:decorated_article) { ArticleDecorator.new(article) }

  it "returns the article's published_at timestamp in long date form" do
    decorated_article.published_date.should == article.published_at.to_s(:long_date)
  end
end
