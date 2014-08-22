class Artist
  include DataMapper::Resource

  property :id,                   Serial
  property :name,                 String,   :required => true
  property :official_site,        String
  property :twitter,              String
  property :echonest_id,          String
  property :spotify_id,           String
  property :rdio_id,              String
  property :itunes_id,            String
  property :location,             String
  property :start_yr_active,      Integer
  property :end_yr_active,        Integer
  property :img,                  String
  property :echonest_hotttnesss,  Float,    :default => 0.0
  property :spotify_popularity,   Integer,  :default => 0
  property :created_at,           DateTime, :default => Time.now()
  property :updated_at,           DateTime, :default => Time.now()

  has n,   :albums
  has n,   :genres
end
