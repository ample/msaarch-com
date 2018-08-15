require 'pry'

module Jekyll
  class AwardsGenerator < Generator
    attr_accessor :site

    def generate(site)
      site.collections['awards'].docs.map do |award|
        award.data['date'] = award.data['date'].strftime('%Y') rescue nil
      end
    end
  end
end