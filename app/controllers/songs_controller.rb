# frozen_string_literal: true

require "rack-flash"

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get "/songs" do
    @songs = Song.all
    erb :"/songs/index"
  end

  get "/songs/new" do
    @artist = Artist.all
    erb :"/songs/new"
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end

  post "/songs" do
    @song = Song.create(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully created song."
    redirect("/songs/#{@song.slug}")
  end

  get "/songs/:slug/edit" do
    puts params
    @song = Song.find_by_slug(params["slug"])
    flash[:message] = "Successfully updated song."
    erb :'/songs/edit'
  end

  patch "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find_or_create_by(name: params["artist"])
    params[:genres].each do |genre|
      genre = Genre.find(genre)
      @song.song_genres.build(genre: genre).save
    end
    @song.save

    flash[:message] = "Successfully updated song."
    redirect to("/songs/#{@song.slug}")
  end
end
