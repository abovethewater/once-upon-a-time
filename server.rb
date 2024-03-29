require 'rubygems'
require 'sinatra'
require 'erb'
require 'json'

class Content
    attr_accessor :centre, :top, :bottom, :left, :right
    
    def initialize(centre)
        @centre = centre
    end
    
end

START_ID = 0
$current_max_id = START_ID

$page_content_store = { $current_max_id => Content.new("Once upon a time") }

def nextId
    $current_max_id = $current_max_id + 1
end

get '/' do
    @page_content = $page_content_store[START_ID]
    @page_id = $current_max_id
    erb :index
end

put '/top' do
    id = params[:id]
    text = params[:text]
    if !id.nil?
        @page_content = $page_content_store[Integer(id)]
        @page_content.top = text
    end
    
    next_id = nextId
    $page_content_store[next_id] = Content.new(text)
    
    content_type :json
        { :id => next_id, :text => text }.to_json    
end

put '/left' do
    @id = params[:id]
    text = params[:text]
    if !id.nil?
        @page_content = $page_content_store[Integer(id)]
        @page_content.left = text
    end
    
    next_id = nextId
    $page_content_store[next_id] = Content.new(text)
    
    content_type :json
        { :id => next_id, :text => text }.to_json    
end

put '/right' do
    @id = params[:id]
    text = params[:text]
    if !id.nil?
        @page_content = $page_content_store[Integer(id)]
        @page_content.right = text
    end
    
    next_id = nextId
    $page_content_store[next_id] = Content.new(text)
    
    content_type :json
        { :id => next_id, :text => text }.to_json    
end

put '/bottom' do
    @id = params[:id]
    text = params[:text]
    if !id.nil?
        @page_content = $page_content_store[Integer(id)]
        @page_content.bottom = text
    end
    
    next_id = nextId
    $page_content_store[next_id] = Content.new(text)
    
    content_type :json
        { :id => next_id, :text => text }.to_json    
end

get '/page/:id' do | id |
    @page_id = Integer(id)
    @page_content = $page_content_store[@page_id]
    puts @page_content.top
    erb :index    
end