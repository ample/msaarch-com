require 'pry'

module Jekyll
  class UserOrderGenerator < Generator
    attr_accessor :site

    def generate(site)
      page = site.collections['pages'].docs.detect { |page| page.data['slug'] == 'about' }
      page.data['principals'] = []
      page.data['associates'] = []
      page.data['others'] = []

      site.collections['users'].docs.map do |user|
        title = user.data['title'].downcase
        if title.include?('principal')
          page.data['principals'] << user
        elsif title.include?('associate')
          page.data['associates'] << user
        else
          page.data['others'] << user
        end
      end
    end
  end
end
