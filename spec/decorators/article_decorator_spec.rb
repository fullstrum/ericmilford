require 'spec_helper'

describe ArticleDecorator do
  let(:article)           { double('Article', published_at: Time.now,
                                              content:      'content',
                                              abstract:     'abstract',
                                              tags:         [
                                                              double('Tag', name: 'tag 1'),
                                                              double('Tag', name: 'tag 2')
                                                            ]) }
  let(:decorated_article) { ArticleDecorator.new(article) }

  it "returns the article's published_at timestamp in long date form" do
    decorated_article.published_date.should == article.published_at.to_s(:long_date)
  end

  it "returns the article's content when an id is present" do
    decorated_article.abstract_or_content('id').should == 'content'
  end

  it "returns the article's abstract when an id is not present" do
    decorated_article.abstract_or_content.should == 'abstract'
  end

  it "returns a comma-separated list of tag names" do
    decorated_article.tags_list.should == 'tag 1, tag 2'
  end
end
