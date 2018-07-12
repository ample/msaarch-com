require 'migration_utils'
class CreateProjects < ContentfulMigrations::Migration

  def up
    with_space do |space|
      content_type = space.content_types.create(
        name: 'Project',
        id: 'project'
      )
      uniqueness = Contentful::Management::Validation.new
      uniqueness.unique = true

      content_type.fields.create(id: 'title', name: 'Title', type: 'Symbol', required: true)
      content_type.fields.create(id: 'slug', name: 'Slug', type: 'Symbol', required: true, validations: [uniqueness])
      content_type.fields.create(id: 'image', name: 'Image', type: 'Link', link_type: 'Asset', required: true)

      content_type.save
      content_type.publish

      with_editor_interfaces do |editor_interfaces|
        editor_interface = editor_interfaces.default(space.id, 'project')
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
      content_type = space.content_types.find('project')
      content_type.unpublish
      content_type.destroy
    end
  end

end
