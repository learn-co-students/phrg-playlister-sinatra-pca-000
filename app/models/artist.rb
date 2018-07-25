# frozen_string_literal: true

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  # extend Slugifiable::ClassMethods
  # include Slugifiable::InstanceMethods

  def slug
    name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    all.find { |artist| artist.slug == slug }
  end
end
