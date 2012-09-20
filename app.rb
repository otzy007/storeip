require 'sinatra'
require 'sinatra/activerecord'
# require './config/enviorments'

# set :database, 'sqlite3:///foo.db'

class IpAddress < ActiveRecord::Base
   validates_uniqueness_of :ip
   validates_presence_of :ip
end

get '/' do
  IpAddress.first.ip
end

get '/:ip' do
  IpAddress.delete_all
  IpAddress.create(:ip => request.ip)
  "STORED"
end