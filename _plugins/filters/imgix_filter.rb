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
      
      original_w = nil
      original_h = nil
      other_params = []

      unless ix_params.nil?
        ix_params.split('&').each do |param|
          key, value = param.split('=')
          if key == 'w'
            original_w = value.to_i
          elsif key == 'h'
            original_h = value.to_i
          else
            other_params << param
          end
        end
      end

      aspect_ratio = nil
      if original_w && original_h && original_h > 0
        aspect_ratio = original_w.to_f / original_h.to_f
      end

      srcset = widths.map do |w|
        current_params_list = ["w=#{w}"]
        if aspect_ratio
          h = (w / aspect_ratio).round
          current_params_list << "h=#{h}"
        elsif original_h # If only h was provided, keep it fixed
          current_params_list << "h=#{original_h}"
        end
        
        current_params_list += other_params
        param_string = current_params_list.join('&')
        
        imgix_url = imgix(url, param_string)
        "#{imgix_url} #{w}w"
      end.join(', ')
      srcset
    end
  end
end

Liquid::Template.register_filter(Jekyll::Imgix)