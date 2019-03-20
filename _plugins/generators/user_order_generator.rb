require 'pry'

module Jekyll
  class UserOrderGenerator < Generator
    attr_accessor :site

    def generate(site)
      page = site.collections['pages'].docs.detect { |page| page.data['slug'] == 'about' }
      page.data['principals'] = []
      page.data['associates'] = []
      page.data['others'] = []

      site.collections['users'].docs.reject{|u| u.data['inactive'] == true }.map do |user|
        title = user.data['title'].downcase
        if title.include?('principal')
          page.data['principals'] << user
        elsif title.include?('associate')
          page.data['associates'] << user
        else
          page.data['others'] << user
        end
      end

      page.data['principals'] = page.data['principals'].sort_by { |last| last.data['last_name']}
      page.data['associates'] = page.data['associates'].sort_by { |last| last.data['last_name']}
      page.data['others'] = page.data['others'].sort_by { |last| last.data['last_name']}
    end
  end
end
