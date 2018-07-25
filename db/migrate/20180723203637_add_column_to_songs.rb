# frozen_string_literal: true

class AddColumnToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :artist_id, :integer
  end
end
