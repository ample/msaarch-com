module Jekyll
  module SiteLogoFilter
    def site_logo(page)
      sports?(page) ? '/assets/images/msa-sport-logo.png' : '/assets/svgs/msa-logo.svg'
    end

    def sports?(page)
      return true if page['url'] =~ /msasport/
      page['markets'] && page['markets'].length == 1 && page['markets'].collect{ |m| m['slug'] }.include?('msasport')
    end
  end
end

Liquid::Template.register_filter(Jekyll::SiteLogoFilter)