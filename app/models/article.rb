class Article
  include MongoMapper::Document

  key :published_at,  Time
  key :title,         String, required: true
  key :abstract,      String, required: true

  timestamps!

  scope :published,   -> { where(published_at: {:$exists => true}) }
  scope :unpublished, -> { where(published_at: {:$exists => false}) }
end
