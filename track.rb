class Track
  include DataMapper::Resource

  property :id,                     Serial
  property :artist_id,              Integer
  property :album_id,               Integer
  property :track_num,              Integer
  property :name,                   String,   :default => 'unknown'
  property :echonest_danceability,  Float
  property :echonest_energy,        Float
  property :echonest_speechiness,   Float
  property :echonest_acousticness,  Float
  property :echonest_liveness,      Float
  property :echonest_tempo,         Float
  property :echonest_time_sig,      Float
  property :echonest_loudness,      Float
  property :echonest_duration,      Float
  property :echonest_key,           Integer
  property :echonest_mode,          Integer
  property :explicit_rating,        Boolean,  :default => false
  property :clean_rating,           Boolean,  :default => false
  property :spotify_popularity,     Integer,  :default => 0
  property :type,                   String
  property :isrc,                   String
  property :spotify_id,             String
  property :rdio_id,                String
  property :itunes_id,              String
  property :created_at,             DateTime, :default => Time.now()
  property :updated_at,             DateTime, :default => Time.now()

  belongs_to  :album
  belongs_to  :artist
  has n,      :genres
end
