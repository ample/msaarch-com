module Jekyll
  module ExcludeFilter
    def exclude(arr, title)
      arr.reject{|obj| obj['title'] == title }
    end
  end
end

Liquid::Template.register_filter(Jekyll::ExcludeFilter)