class Tag
  include MongoMapper::Document

  key :name, String, required: true, unique: true
end
