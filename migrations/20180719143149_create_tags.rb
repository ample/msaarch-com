require 'migration_utils'
class CreateTags < ContentfulMigrations::Migration

  def up
    with_space do |space|
      content_type = space.content_types.create(
        name: 'Tag',
        id: 'tag'
      )

      uniqueness = Contentful::Management::Validation.new
      uniqueness.unique = true

      content_type.fields.create(id: 'title', name: 'Title', type: 'Symbol', required: true, validations: [uniqueness])
      content_type.fields.create(id: 'slug', name: 'Slug', type: 'Symbol', required: true, validations: [uniqueness])

      content_type.save
      content_type.publish

      with_editor_interfaces do |editor_interfaces|
        editor_interface = editor_interfaces.default(space.id, 'tag')
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
      content_type = space.content_types.find('tag')
      content_type.unpublish
      content_type.destroy
    end
  end

end