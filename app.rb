require 'rubygems'
require 'sinatra'
require 'data_mapper'
require 'dm-migrations'
require 'haml'
require 'sass'
require 'plist'

require_relative 'artist'
require_relative 'album'
require_relative 'track'
require_relative 'user'
require_relative 'collection'
require_relative 'genre'

DataMapper.setup(:default, 'postgres://localhost/music_love')
DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do
  @title = "music:love"

  haml :index
end


get '/setup' do
  @title = "music:love | user setup"
  haml :setup
end

# post '/setup' do
#   input = Plist::parse_xml(params['itunes_lib'][:filename])
# end


post "/setup" do
  File.open('uploads/' + params['itunes_lib'][:filename], "w") do |f|
    f.write(params['itunes_lib'][:tempfile].read)
  end
  # input = Plist::parse_xml('uploads/' + params['itunes_lib'][:filename])
  # puts input["Tracks"]

  # new_user = User.first_or_create({:username => params['username'], :email => params['email'], :itunes_lib => params['itunes_lib'][:tempfile], :created_at => Time.now, :updated_at => Time.now})

  new_user = User.new
  new_user.attributes = { :username => params['username'],
                          :email => params['email'],
                          :itunes_lib => true,
                          :created_at => Time.now,
                          :updated_at => Time.now }
  new_user.save
  puts new_user.saved?

  return "The file was successfully uploaded!"
end
