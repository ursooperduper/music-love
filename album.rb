class Album
  include DataMapper::Resource

  property :id,                       Serial
  property :name,                     String
  property :artist_id,                Integer
  property :release_date,             String
  property :release_date_precision,   String
  property :spotify_id,               String
  property :rdio_id,                  String
  property :itunes_id,                String
  property :spotify_popularity,       Integer,  :default => 0
  property :explicit_rating,          Boolean,  :default => false
  property :clean_rating,             Boolean,  :default => false
  property :type,                     String
  property :upc,                      String
  property :album_art,                String
  property :created_at,               DateTime, :default => Time.now()
  property :updated_at,               DateTime, :default => Time.now()

  belongs_to    :artist
  has n,        :tracks
  has n,        :genres
end
