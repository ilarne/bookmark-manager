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
    tagz = params[:tag].split(', ')
    tagz.each do |tagz|
      tag = Tag.first_or_create(category: tagz) unless tags.nil?
      link.tags << tag
    end
    link.save
    redirect '/links'
  end


  get '/tags/:category' do
    tag = Tag.first(category: params[:category])
    @links = tag ? tag.links : []
    erb :'links/index'
  end
end
