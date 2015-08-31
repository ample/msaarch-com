require 'nokogiri'
require 'dragonfly'

module ApplicationHelper
  
  # Admin Helpers

  def title(title)
    content_for(:title) { h(title) }
    return title
  end
  
  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end
  
  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end
  
  def show_flashes
    messages = ''.html_safe 
    flash.collect { |k,v| 
      messages << content_tag(:div, v.html_safe, :class => "flash #{k}" )
    }
    content_tag(:div, messages, :id => 'notifications')
  end
  
  def link_to_active(name, url, html_options = {})
    html_options[:class] = "active" if current_page?(url)
    link_to(name, url, html_options)
  end
  
  def link_to_section(cont, name, url, html_options = {})
    html_options[:class] = "active" if controller.controller_name == cont
    html_options[:title] = name
    link_to(name, url, html_options)
  end
  
  def link_to_new(model, url, options = {})
    link_to "Create New" + (options[:short] ? '' : " #{model.to_s.humanize}"), url, :class => 'new_object', :title => "Create New #{model.to_s.humanize}"
  end
  
  def manage_object(object, options = {})
    content_tag :div, :class => 'manage_object' do 
      link_to(image_tag('admin/delete_btn.gif'), eval("#{object.class.to_s.demodulize.underscore}_path(#{object.id})"), :method => :delete, :confirm => 'Are you sure?', :title => "Delete this #{object.class.to_s.demodulize.humanize}") + 
      "&nbsp;".html_safe + 
      (options[:sortable] ? image_tag('admin/move_btn.gif', :class => 'handle') : '')
    end
  end
  
  # Asset Helpers
  
  def asset_drop(object, asset_sym)
    asset = eval("object.#{asset_sym.to_s}")
    rel = [object.class.to_s.underscore, asset_sym.to_s, 'id'].join('_')
    html = ''
    html << content_tag(:div, :rel => current_asset_drop_class, :class => 'asset_drop column droppable') do
      if asset.present?
        render :partial => 'admin/assets/asset', :object => asset
      else
        'Drag Asset Here'
      end
    end
    if asset.present?
      html << link_to( 'Remove', '#', :class => 'remove-asset', :rel => current_asset_drop_class )
    end
    html << '<br clear="both" />'
    html.html_safe
  end
  
  def current_asset_drop_class
    @asset_drop_class ||= 0
    "asset_drop_#{@asset_drop_class}"
  end
  
  def next_asset_drop_class
    @asset_drop_class ||= 0
    "asset_drop_#{@asset_drop_class+=1}"
  end
  
  # Returns image tag for an object's attachment, with optional link element wrapped around it. 
  #
  #   @param Object                   - Required 
  #   @param String :alt              - Defaults to object.title
  #   @param String :title
  #   @param String :class
  #   @param String :style
  #   @param String :dimensions       - Dragonfly-esque dimensions... @see http://markevans.github.com/dragonfly/file.Processing.html
  #   @param String :link             - Destination for link_to tag 
  #   @param Symbol :encode           - :gif, :jpg, :png, etc. Defaults to :png
  #   @param Object :object           - Dragonfly object, defaults to object.asset
  #   @param Boolean :video           - Link to an iframe lightbox?
  #   @param String :video_dimensions - (width)x(height), defaults to 500x350
  #
  def image_asset(object, args={})
    opts = {}
    opts[:alt] = args[:alt] || ''
    opts[:title] = args[:title] || nil
    opts[:class] = args[:class] || nil
    opts[:style] = args[:style] || nil

    if object.respond_to?('title')
      opts[:alt] = object.title
    end
    
    encode = args[:encode] || :jpg
    dimensions = args[:dimensions] || false
    dfly_object = args[:object] || nil
    video = args[:video] || nil
    video_dimensions = args[:video_dimensions] || '500x350'

    unless dfly_object.nil?
      asset = dfly_object.attachment
      gravity = dfly_object.attachment_gravity
    else 
      asset = object.asset.attachment
      gravity = object.asset.attachment_gravity
    end
 
    if dimensions
      size = /[0-9]{1,}x[0-9]{1,}/.match(dimensions)
    end

    # If this is a crop, try to add gravity
    if dimensions.include?('#')
      width, height = size[0].split('x')
      image = asset.process(:resize_and_crop, :width => width, :height => height, :gravity => gravity).encode(encode)
    else
      image = dimensions ? asset.process(:thumb,dimensions).encode(encode) : asset.encode(encode)
    end
    
    if size
      opts[:size] = size[0]
    else
      opts[:size] = "#{image.width}x#{image.height}"
    end

    logger.debug "#{opts}"

    unless args[:link].nil?
      unless video.nil?
        link_to image_tag( image.url, opts ), args[:link], :rel => 'facebox', :rev => "iframe|#{video_dimensions}"
      else
        link_to image_tag( image.url, opts ), args[:link]
      end
    else 
      img = image_tag( image.url, opts )
    end
  end
  
  # Block Helpers
  
  def block_attribute_for(page, block_name, block_type)
    block = page.blocks.find_by_name(block_name.to_s, :conditions => { :block_type => block_type.to_s })
    if block
      render :partial => "public/blocks/#{block_type}", :locals => { :block => block }
    end
  end
  
  # Page Helpers
  
  def faq_format(content)

    toc = '<ol>'
    doc = ::Nokogiri::HTML::DocumentFragment.parse(content)
    doc.css('h4').each_with_index do |header,index|
      id = "question_#{index+1}"    
      toc << %(<li><a href="##{id}">#{header.content}</a></li>)
      header['id'] = id
      header.content = "#{index+1}. #{header.inner_html}"
    end
    toc << '</ol><hr />'
    raw(toc + doc.to_s)
  end

  def clippy(text, bgcolor='#FFFFFF')
    html = <<-EOF
      <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
              width="110"
              height="14"
              id="clippy" >
      <param name="movie" value="/no-digest-assets/admin/swf/clippy.swf"/>
      <param name="allowScriptAccess" value="always" />
      <param name="quality" value="high" />
      <param name="scale" value="noscale" />
      <param NAME="FlashVars" value="text=#{text}">
      <param name="bgcolor" value="#{bgcolor}">
      <embed src="/no-digest-assets/admin/swf/clippy.swf"
             width="110"
             height="14"
             name="clippy"
             quality="high"
             allowScriptAccess="always"
             type="application/x-shockwave-flash"
             pluginspage="http://www.macromedia.com/go/getflashplayer"
             FlashVars="text=#{text}"
             bgcolor="#{bgcolor}"
      />
      </object>
    EOF
  end
  
  def template_field_help(form)
    # see if there is help available for this template
    return unless form.object.page.template.help
    help_text = form.object.page.template.help[form.object.name]
    html = ''
    # see if there is help available for this field
    unless help_text.blank?
      html << " (<a href=\"javascript:void(0)\" class=\"quiet\" data-tip=\"#{help_text}\">Details</a>)"
    end
    html.html_safe
  end

end
