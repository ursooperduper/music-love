class User
  include DataMapper::Resource

  # just some basic data for now, we'll worry about auth later
  property :id,                 Serial
  property :username,           String
  property :email,              String
  property :itunes_lib,         Boolean,    :default => false
  property :created_at,         DateTime,   :default => Time.now()
  property :updated_at,         DateTime,   :default => Time.now()
end
