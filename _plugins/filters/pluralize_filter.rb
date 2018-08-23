require 'active_support/all'

module Jekyll
  module Pluralize
    include ::ActiveSupport::Inflector

    def pluralize(str)
      str.pluralize
    end
  end
end

Liquid::Template.register_filter(Jekyll::Pluralize)