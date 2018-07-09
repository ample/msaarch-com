require 'pry'

module Jekyll
  class ScopedIncludesGenerator < Generator
    attr_accessor :site

    def generate(site)
      blocks_path = "#{site.source}/_includes/blocks"
      includes = Hash[Dir.glob("#{blocks_path}/**/*/").collect{|dir|
        files = Dir.glob("#{dir}**/*.html").collect{|f| File.basename(f, '.html') }
        [dir.sub("#{blocks_path}/", '')[0...-1], files.join(' ')]
      }]
      site.config['scoped_includes'] = includes
    end
  end
end