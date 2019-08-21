require 'pry'

module Jekyll
  class ProjectsGenerator < Generator
    attr_accessor :site

    def generate(site)
      site.collections['markets'].docs.map do |market|
        market.data['projects'].each do |project|
          url = [
            '',
            'markets',
            market.data['slug'],
            project['slug'],
          ].join('/') rescue nil
          project['url'] = url
        end
      end
    end
  end
end