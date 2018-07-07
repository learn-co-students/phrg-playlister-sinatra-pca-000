# frozen_string_literal: true

class Song < ActiveRecord::Base
  has_many :song_genres
  belongs_to :artist
  has_many :genres, through: :song_genres

  def slug
    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Song.all.each do |song|
      if song.slug == slug
        return song
      end
    end
  end
end
