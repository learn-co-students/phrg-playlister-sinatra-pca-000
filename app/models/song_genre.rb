# frozen_string_literal: true

require_relative "./concerns/slugifiable.rb"

class SongGenre < ActiveRecord::Base
  belongs_to :song
  belongs_to :genre
end
