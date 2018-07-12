require 'migration_utils'
class CreateCaseStudies < ContentfulMigrations::Migration

  def up
    with_space do |space|
      content_type = space.content_types.create(
        name: 'Case Study',
        id: 'case_study'
      )
      uniqueness = Contentful::Management::Validation.new
      uniqueness.unique = true

      content_type.fields.create(id: 'title', name: 'Title', type: 'Symbol', required: true)
      content_type.fields.create(id: 'slug', name: 'Slug', type: 'Symbol', required: true, validations: [uniqueness])
      content_type.fields.create(id: 'image', name: 'Image', type: 'Link', link_type: 'Asset', required: true)

      content_type.save
      content_type.publish

      with_editor_interfaces do |editor_interfaces|
        editor_interface = editor_interfaces.default(space.id, 'case_study')
        controls = editor_interface.controls.map do |control|
          control["widgetId"] = 'slugEditor' if control["fieldId"] == 'slug'
          control
        end
        editor_interface.update(controls: controls)
        editor_interface.reload
      end

      content_type.save
      content_type.publish
    end
  end

  def down
    with_space do |space|
      content_type = space.content_types.find('case_study')
      content_type.unpublish
      content_type.destroy
    end
  end

end