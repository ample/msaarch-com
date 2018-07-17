module Jekyll
  module Newlines
    include ActiveSupport::Inflector
    def newlines(str)
      str.gsub(/\s?\\n?/, "\s<br>\s")
    end
  end
end

Liquid::Template.register_filter(Jekyll::Newlines)