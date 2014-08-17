class Genre
  include DataMapper::Resource

  property :id,                 Serial
  property :name,               String
  property :created_at,         DateTime,    :default => Time.now()
  property :updated_at,         DateTime,    :default => Time.now()
end
