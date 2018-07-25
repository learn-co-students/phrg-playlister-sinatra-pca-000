# frozen_string_literal: true

module Slugifiable
  module InstanceMethods
    def slug
      name.downcase.split(" ").join("-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      all.find { |instance| instance.slug == slug }
    end
  end
end
