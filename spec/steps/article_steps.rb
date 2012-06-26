#-- Given
step 'there is/are :count published article(s)' do |count|
  if count.zero?
    Article.unset(:published)
  else
    count.times { create(:article, :published) }
  end
end

step 'there are unpublished articles' do
  create(:article, :unpublished)
end


#-- When
step 'I go to the next page of published articles' do
  click_link 'Older Articles'
end

step 'I click to read that article' do
  visit root_path
  click_link Article.last.title
end


#-- Then
step 'I should see a no articles message' do
  page.should have_content('No articles have been written.')
end

step 'I should see (an )abstract(s) for :how_many published article(s)' do |how_many|
  @remaining_articles = how_many

  ArticleDecorator.decorate(Article.published.limit(how_many)).each do |article|
    page.should have_content(article.title)
    page.should have_content(article.abstract)
    page.should have_content(article.published_date)
  end
end

step 'I should not see abstracts for the remaining published articles' do
  raise StandardError, 'Expected @remaining_articles to be set' unless @remaining_articles.present?

  Article.published.offset(@remaining_articles).each do |article|
    page.should have_no_content(article.title)
  end
end

step 'I should see abstracts for the remaining published articles' do
  raise StandardError, 'Expected @remaining_articles to be set' unless @remaining_articles.present?

  ArticleDecorator.decorate(Article.published.offset(@remaining_articles)).each do |article|
    page.should have_content(article.title)
    page.should have_content(article.abstract)
    page.should have_content(article.published_date)
  end
end

step 'I should not see an abstract for any unpublished articles' do
  Article.unpublished.each do |article|
    page.should have_no_content(article.title)
  end
end

step 'I should see that article\'s content' do
  article = ArticleDecorator.last
  page.should have_content(article.title)
  page.should have_content(article.content)
  page.should have_content(article.published_date)
end
