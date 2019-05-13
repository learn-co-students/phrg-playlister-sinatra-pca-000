# frozen_string_literal: true

class SongsController < ApplicationController
  use Rack::Flash

  get "/songs" do
    @songs = Song.all
    erb :'/songs/index'
  end

  get "/songs/new" do
    erb :'/songs/new'
  end

  post "/songs" do
    @song = Song.new(name: params["Name"])
    @artist = nil
    @artist = if !Artist.find_by_name(params["Artist Name"])
                Artist.new(name: params["Artist Name"])
              else
                Artist.find_by_name(params["Artist Name"])
              end
    @genre = Genre.find(params["genres"][0])
    @song.artist = @artist
    @song.genres << @genre
    @artist.save
    @song.save

    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.slug}"
  end

  get "/songs/:slug" do
    puts params
    @song = Song.find_by_slug(params["slug"])
    erb :'/songs/show'
  end

  get "/songs/:slug/edit" do
    puts params
    @song = Song.find_by_slug(params["slug"])
    flash[:message] = "Successfully updated song."
    erb :'/songs/edit'
  end

  patch "/songs/:slug" do
    puts params
    @song = Song.find_by_slug(params["slug"])
    @artist = @song.artist
    if params["Artist Name"] != ""
      @artist.name = params["Artist Name"]
      @song.artist = @artist
      @song.artist.name = params["Artist Name"]
      @artist.save
    end
    if params["genres"]
      @song.genres.clear
      @genre = Genre.find(params["genres"][0])
      @song.genres << @genre
    end
    @song.save
    redirect to "songs/#{@song.slug}"
  end
end
