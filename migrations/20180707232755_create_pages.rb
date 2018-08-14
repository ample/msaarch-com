require 'migration_utils'
class CreatePages < ContentfulMigrations::Migration

  def up
    with_space do |space|
      content_type = space.content_types.create(
        name: 'Page',
        id: 'page'
      )
      uniqueness = Contentful::Management::Validation.new
      uniqueness.unique = true

      content_type.fields.create(id: 'title', name: 'Title', type: 'Symbol', required: true)
      content_type.fields.create(id: 'subtitle', name: 'Subtitle', type: 'Symbol')
      content_type.fields.create(id: 'slug', name: 'Slug', type: 'Symbol', required: true, validations: [uniqueness])
      content_type.fields.create(id: 'image', name: 'Image', type: 'Link', link_type: 'Asset', required: true)

      of_type = Contentful::Management::Validation.new
      of_type.link_content_type =  ['feature', 'media_object', 'text_object']

      items = Contentful::Management::Field.new
      items.type = 'Link'
      items.link_type = 'Entry'
      items.validations = [of_type]
      content_type.fields.create(id: 'blocks', name: 'Blocks', type: 'Array', items: items)

      content_type.fields.create(id: 'body', name: 'Body', type: 'Text')

      validation_in = Contentful::Management::Validation.new
      validation_in.in = ['home', 'work', 'blog', 'contact']
      content_type.fields.create(id: 'layout', name: 'Layout', type: 'Symbol', required: true, validations: [validation_in])

      content_type.save
      content_type.publish

      with_editor_interfaces do |editor_interfaces|
        editor_interface = editor_interfaces.default(space.id, 'page')
        controls = editor_interface.controls.map do |control|
          control["widgetId"] = 'slugEditor' if control["fieldId"] == 'slug'
          control["widgetId"] = 'dropdown' if control["fieldId"] == 'layout'
          control
        end
        editor_interface.update(controls: controls)
        editor_interface.reload
      end
    end
  end

  def down
    with_space do |space|
      content_type = space.content_types.find('page')
      content_type.unpublish
      content_type.destroy
    end
  end

end