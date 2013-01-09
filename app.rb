require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:///db/database.db' unless ENV['DATABASE_URL']

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