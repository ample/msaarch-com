module Jekyll
  module Imgix
    def imgix(url, ix_params=nil)
      url.sub!(/images.ctfassets.net\/#{ENV['CONTENTFUL_SPACE_ID']}/, 'msa.imgix.net')
      query = "?auto=format,compress#{"&#{ix_params}" unless ix_params.nil?}"
      "#{url}#{query}"
    rescue
      url
    end
  end
end

Liquid::Template.register_filter(Jekyll::Imgix)