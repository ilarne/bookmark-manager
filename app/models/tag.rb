require 'data_mapper'
require 'dm-postgres-adapter'

class Tag
  include DataMapper::Resource

property :id, Serial
property :category, String

has n, :links, through: Resource

end
