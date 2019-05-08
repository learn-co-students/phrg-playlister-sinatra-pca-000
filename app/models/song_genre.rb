# frozen_string_literal: true

class SongGenre < ActiveRecord::Base
  belongs_to :genre
  belongs_to :song
end
