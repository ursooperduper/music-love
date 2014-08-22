class Collection
  include DataMapper::Resource

  property :id,   Serial

  belongs_to      :user
  has n,          :tracks
end
