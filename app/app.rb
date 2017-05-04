ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative '../data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb(:'links/index')
  end

  get '/links/new' do
    erb(:'links/submit_link')
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(category: params[:tag])
    link.tags << tag
    link.save
    redirect '/links'
  end


  get '/tags/:category' do
    tag = Tag.first(category: params[:category])
    @links = tag ? tag.links : []
    erb :'links/index'
  end
end
