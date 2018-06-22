require 'migration_utils'
class CreatePages < ContentfulMigrations::Migration

  def up
    with_space do |space|
      content_type = space.content_types.create(
        name: 'Page',
        id: 'page',
        description: 'A piece of content distinguished by a unique path'
      )
      validation = Contentful::Management::Validation.new
      validation.unique = true


      content_type.fields.create(id: 'title', name: 'Title', type: 'Symbol', required: true)
      content_type.fields.create(id: 'slug', name: 'Slug', type: 'Symbol', required: true, validations: [validation])
      content_type.fields.create(id: 'body', name: 'Body', type: 'Text')

      validation_in = Contentful::Management::Validation.new
      validation_in.in = ['default']
      content_type.fields.create(id: 'layout', name: 'Layout', type: 'Symbol', required: true, validations: [validation_in])

      content_type.save
      content_type.publish
      with_editor_interfaces do |editor_interfaces|
        editor_interface = editor_interfaces.default(space.id, 'page')
        controls = editor_interface.controls.map do |control|
          control["widgetId"] = 'slugEditor' if control["fieldId"] == 'slug'
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