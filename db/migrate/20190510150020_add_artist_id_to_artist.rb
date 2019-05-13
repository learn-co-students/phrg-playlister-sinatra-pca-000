# frozen_string_literal: true

class AddArtistIdToArtist < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :artist_id, :integer
  end
end
