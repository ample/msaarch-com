module Templating augmentation do

  class Templating::Template

    attr_accessor :path, :view_path, :partial_view_path, :content, :data, :filename
  
    def initialize(full_path)
      @path = full_path
      @filename = full_path[/(\w+:?).(html|js).erb/, 1]
      @view_path = full_path[/(app\/views\/)(.+:?).(html|js).erb/, 2]
      @partial_view_path = @view_path.gsub('/_', '/')
      @content = File.read(@path)
      if @content =~ /^(<%# ---\s+)(.*?)(\s+--- %>)/m
        @data = YAML.load($2).symbolize_keys
        remove_instance_variable(:@content)
      end
      @data ||= {}
    end

    def method_missing(method, *args, &block)
      @data[method.to_sym]
    end

    def fields
      @fields ||= @data[:fields].sort { |x,y| y <=> x }
    end

  end

  ###---------------------------------------------------- Instance Methods

  def template
    template = detect_template
    if template.nil?
      hash_key = self.class.to_s.pluralize.underscore.sub('ample_admin/', '').to_sym
      self.template_filename = AmpleAdmin::Engine.config.templates[hash_key][:default]
      self.save!
      template = detect_template
    end
    @template ||= template
  end

  def detect_template
    self.class.templates.detect { |t| t.filename == template_filename }
  end

  ###---------------------------------------------------- Class Methods

  cattr_accessor :templates

  def self.templates
    @@templates ||= Dir.glob(template_path('*')).collect { |f| Template.new(f) }.sort { |x,y| x.filename <=> y.filename }
  end

  def self.template_path(name)
    File.join(AmpleAdmin::Engine.config.templates[self.to_s.pluralize.underscore.to_sym][:path], "#{name}.*.erb")
  end
  
  def self.templates_for_select
    self.templates.collect { |template| [template.name, template.filename] }
  end

end end