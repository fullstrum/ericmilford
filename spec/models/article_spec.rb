require 'spec_helper'

describe Article do
  let(:article) { build(:article) }

  describe "validations" do
    [:title, :abstract, :content].each do |attribute|
      it "requires the #{attribute} attribute to be present" do
        article.should be_valid
        article.send("#{attribute}=", nil)
        article.should_not be_valid
      end
    end

    it "requires a unique title" do
      article.should be_valid
      existing_article = create(:article)
      article.title = existing_article.title
      article.should_not be_valid
    end
  end

  describe ".before_save" do
    it "generates a slug from the title on create" do
      article.should_receive(:slug=).with(article.title.parameterize)
      article.save
    end
  end
end
