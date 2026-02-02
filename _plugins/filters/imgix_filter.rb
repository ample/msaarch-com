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
      
      # Parse ix_params to extract 'h' and other parameters, ignoring 'w'
      parsed_params = {}
      unless ix_params.nil?
        ix_params.split('&').each do |param|
          key, value = param.split('=')
          parsed_params[key] = value unless key == 'w' # Ignore 'w' from original params
        end
      end

      srcset = widths.map do |w|
        current_params = parsed_params.merge('w' => w)
        
        param_string = current_params.map { |k, v| "#{k}=#{v}" }.join('&')
        
        imgix_url = imgix(url, param_string)
        "#{imgix_url} #{w}w"
      end.join(', ')
      srcset
    end
  end
end

Liquid::Template.register_filter(Jekyll::Imgix)