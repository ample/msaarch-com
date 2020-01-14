require 'pry'

module Jekyll
  class ProjectsGenerator < Generator
    attr_accessor :site

    def generate(site)
      site.collections['markets'].docs.map do |market|
        market.data['projects'].each do |project|
          url = [
            '',
            'projects',
            project['slug'],
          ].join('/') rescue nil
          project['url'] = url

          if _project = site.collections['projects'].docs.detect{|p| p.data['slug'] === project['slug']}
            if _project.data['markets'].present?
              _project.data['markets'].push(market)
            else
              _project.data['markets'] = [market]
            end
          end
        end
      end

    end

  end
end