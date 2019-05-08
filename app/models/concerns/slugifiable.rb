# frozen_string_literal: true

module Slugifiable
  module InstanceMethods
    def slug
      self.name.gsub(" ", "-").downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find { |t| t.slug == slug }
    end
  end
end
