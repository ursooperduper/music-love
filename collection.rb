class Collection
  include DataMapper::Resource

  property :id,   Serial

  belongs_to      :user
  has n,          :albums
  has n,          :artists
  has n,          :tracks

end
