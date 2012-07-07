class Article
  include Mongoid::Document
  include Mongoid::Timestamps

  field :published_at, type: Time
  field :title,        type: String
  field :abstract,     type: String
  field :content,      type: String
  field :slug,         type: String

  validates :title,    presence: true, uniqueness: true
  validates :abstract, presence: true
  validates :content,  presence: true

  has_and_belongs_to_many :tags

  before_save :set_slug

  scope :published,   -> { where(:published_at.nin => [nil, ""]) }
  scope :unpublished, -> { where(:published_at.in  => [nil, ""]) }


  def to_param
    slug
  end

  def set_slug
    self.slug = title.parameterize
  end
end
