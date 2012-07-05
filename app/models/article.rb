class Article
  include MongoMapper::Document

  key :published_at,  Time
  key :title,         String, required: true
  key :abstract,      String, required: true
  key :content,       String, required: true
  key :slug,          String, required: true, unique: true
  key :tag_ids,       Array

  timestamps!

  many :tags, in: :tag_ids

  before_validation :set_slug

  scope :published,   -> { where(published_at: {:$exists => true}) }
  scope :unpublished, -> { where(published_at: {:$exists => false}) }


  def to_param
    slug
  end

  def set_slug
    self.slug = title.parameterize
  end
end
