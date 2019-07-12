# frozen_string_literal: true

require_relative "concerns/slugifiable"

class Artist < ActiveRecord::Base
  include Slugifiable::InstanceMethod
  extend Slugifiable::ClassMethod
  has_many :songs
  has_many :genres, through: :songs
end
