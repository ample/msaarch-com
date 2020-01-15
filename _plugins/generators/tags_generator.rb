require 'pry'

module Jekyll
  class TagsGenerator < Generator
    attr_accessor :site

    def generate(site)
      site.collections['tags'].docs.each do |doc|
        tags = site.collections['posts'].docs.select do |post|
          tags = post.data['tags'].collect{|tag| tag['slug']}
          tags.include?(doc.data['slug'])
        end
        doc.data['posts'] = tags
      end
    end
  end
end