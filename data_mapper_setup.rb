require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './app/models/link'
require_relative './app/models/tag'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
