# frozen_string_literal: true

class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    all.find { |artist| artist.slug == slug }
  end
end
