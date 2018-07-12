module Jekyll
  module Imgix
    def imgix(url)
      url.sub(/images.ctfassets.net\/#{ENV['CONTENTFUL_SPACE_ID']}/, 'msa.imgix.net')
    rescue
      url
    end
  end
end

Liquid::Template.register_filter(Jekyll::Imgix)