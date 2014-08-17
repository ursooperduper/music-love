require 'rubygems'
require 'sinatra'
require 'data_mapper'
require 'haml'
require 'sass'

require_relative 'artist'
require_relative 'album'
require_relative 'track'
require_relative 'user'
require_relative 'collection'
require_relative 'genre'

DataMapper.setup(:default, 'postgres://localhost/music_love')

get '/' do
  @title = "music:love"

  haml :index
end
