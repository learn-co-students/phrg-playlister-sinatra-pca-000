# frozen_string_literal: true

class GenresController < ApplicationController
  get "/genres" do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get "/genres/new" do
    "hello"
  end

  get "/genres/:slug" do
    puts params
    @genre = nil
    Genre.all.each do |genre|
      @genre = genre if genre.slug == params["slug"]
    end
    erb :'/genres/show'
  end
end
