module Jekyll
  module ExcludeFilter
    def exclude(arr, *args)
      if args.is_a?(String)
        arr.reject{|obj| obj['title'] == title }
      else
        arr.reject{|obj| obj[args[0]] == args[1] }
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::ExcludeFilter)