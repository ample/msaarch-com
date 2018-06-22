module MigrationUtils

  attr_accessor :type

  def uniqueness_of
    validation = Contentful::Management::Validation.new
    validation.unique = true
    validation
  end

  def apply_editor(space, field, editor, type=nil)
    with_editor_interfaces do |editor_interfaces|
      editor_interface = editor_interfaces.default(space.id, type || content_type_id)
      controls = editor_interface.controls.map do |control|
        control["widgetId"] = editor if control["fieldId"] == field
        control
      end
      editor_interface.update(controls: controls)
      editor_interface.reload
    end
  end

  def items_of_type(link_type, validates=nil)
    items = Contentful::Management::Field.new
    items.type = 'Link'
    items.link_type = link_type
    unless validates.nil?
      if validates.is_a?(Array)
        validations = validates.collect{|k| validation_of_type(k) }
      else
        validations = [ validation_of_type(validates) ]
      end
      items.validations = validations
    end
    items
  end

  def validation_of_type(link_type)
    validation_link_content_type = Contentful::Management::Validation.new
    validation_link_content_type.link_content_type =  [link_type]
    validation_link_content_type
  end

end