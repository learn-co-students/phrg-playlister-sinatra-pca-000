# frozen_string_literal: true

module Slugifiable
  module InstanceMethod
    def slug
      name.downcase.gsub(" ", "-")
    end
  end

  module ClassMethod
    def find_by_slug(input)
      all.find { |item| item.slug == input }
    end
  end
end
