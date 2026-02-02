module Jekyll
  module Imgix
    def imgix(url, ix_params=nil)
      url.sub!(/images.ctfassets.net\/#{ENV['CONTENTFUL_SPACE_ID']}/, 'msa.imgix.net')
      query = "?auto=format,compress#{"&#{ix_params}" unless ix_params.nil?}"
      "#{url}#{query}"
    rescue
      url
    end

    def imgix_srcset(url, ix_params=nil)
      widths = [320, 640, 960, 1280, 1920, 2560]
      srcset = widths.map do |w|
        imgix_url = imgix(url, "w=#{w}#{"&#{ix_params}" unless ix_params.nil?}")
        "#{imgix_url} #{w}w"
      end.join(', ')
      srcset
    end
  end
end

Liquid::Template.register_filter(Jekyll::Imgix)