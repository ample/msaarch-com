require 'migration_utils'
class CreateMarkets < ContentfulMigrations::Migration

  def up
    with_space do |space|
      content_type = space.content_types.create(
        name: 'Market',
        id: 'market'
      )
      uniqueness = Contentful::Management::Validation.new
      uniqueness.unique = true

      content_type.fields.create(id: 'title', name: 'Title', type: 'Symbol', required: true)
      content_type.fields.create(id: 'slug', name: 'Slug', type: 'Symbol', required: true, validations: [uniqueness])
      content_type.fields.create(id: 'image', name: 'Image', type: 'Link', link_type: 'Asset', required: true)

      of_type = Contentful::Management::Validation.new
      of_type.link_content_type =  ['project']
      items = Contentful::Management::Field.new
      items.type = 'Link'
      items.link_type = 'Entry'
      items.validations = [of_type]
      content_type.fields.create(id: 'projects', name: 'Projects', type: 'Array', items: items)

      of_type = Contentful::Management::Validation.new
      of_type.link_content_type =  ['case_study']
      items = Contentful::Management::Field.new
      items.type = 'Link'
      items.link_type = 'Entry'
      items.validations = [of_type]
      content_type.fields.create(id: 'case_studies', name: 'Case Study', type: 'Array', items: items)

      content_type.save
      content_type.publish

      with_editor_interfaces do |editor_interfaces|
        editor_interface = editor_interfaces.default(space.id, 'market')
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
      content_type = space.content_types.find('market')
      content_type.unpublish
      content_type.destroy
    end
  end

end