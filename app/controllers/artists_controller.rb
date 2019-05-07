# frozen_string_literal: true

class ArtistsController < ApplicationController
  get "/artists" do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get "/artists/new" do
    "hello"
  end

  get "/artists/:slug" do
    puts params
    @artist = nil
    Artist.all.each do |artist|
      @artist = artist if artist.slug == params["slug"]
    end
    erb :'/artists/show'
  end
end
