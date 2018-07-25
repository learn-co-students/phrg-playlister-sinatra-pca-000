# frozen_string_literal: true

# require 'rack-flash'

class SongsController < ApplicationController
  # use Rack::Flash

  get "/songs" do
    @songs = Song.all
    erb :'songs/index'
  end

  get "/songs/new" do
    @genres = Genre.all
    erb :'songs/new'
  end

  get "/songs/:slug" do
    @song = Song.all.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post "/songs" do
    genre_ids = params["genres"]
    genres = genre_ids.map do |genre_id|
      Genre.find(genre_id)
    end

    artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song = Song.create(name: params["Name"], artist: artist, genres: genres)
    redirect "/songs/#{@song.slug}"
  end

  get "/songs/:slug/edit" do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'songs/edit'
  end

  patch "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    genre_ids = params["genres"]
    genres = genre_ids.map do |genre_id|
      Genre.find(genre_id)
    end

    unless params["Artist Name"].empty?
      @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
      @song.genres = genres
      @song.save
    end
    redirect "/songs/#{@song.slug}"
  end
end
