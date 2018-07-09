require 'migration_utils'
class CreateFeatures < ContentfulMigrations::Migration

  def up
    with_space do |space|
      content_type = space.content_types.create(
        name: 'Feature',
        id: 'feature'
      )
      content_type.fields.create(id: 'title', name: 'Title', type: 'Symbol', required: true)
      content_type.fields.create(id: 'body', name: 'Body', type: 'Text')
      content_type.fields.create(id: 'href', name: 'Link To', type: 'Symbol')
      content_type.fields.create(id: 'image', name: 'Image', type: 'Link', link_type: 'Asset')

      content_type.save
      content_type.publish

      with_editor_interfaces do |editor_interfaces|
        editor_interface = editor_interfaces.default(space.id, 'feature')
        controls = editor_interface.controls.map do |control|
          control["widgetId"] = 'urlEditor' if control["fieldId"] == 'href'
          control
        end
        editor_interface.update(controls: controls)
        editor_interface.reload
      end
    end
  end

  def down
    with_space do |space|
      content_type = space.content_types.find('feature')
      content_type.unpublish
      content_type.destroy
    end
  end

end