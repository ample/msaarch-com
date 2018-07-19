require 'migration_utils'
class CreatePosts < ContentfulMigrations::Migration

  def up
    with_space do |space|
      content_type = space.content_types.create(
        name: 'Post',
        id: 'post'
      )
      uniqueness = Contentful::Management::Validation.new
      uniqueness.unique = true

      content_type.fields.create(id: 'title', name: 'Title', type: 'Symbol', required: true)
      content_type.fields.create(id: 'slug', name: 'Slug', type: 'Symbol', required: true, validations: [uniqueness])
      content_type.fields.create(id: 'location', name: 'Location', type: 'Symbol')
      content_type.fields.create(id: 'pubished_at', name: 'Published At', type: 'Date')

      validation = Contentful::Management::Validation.new
      validation.link_content_type =  ['user']
      content_type.fields.create(id: 'author', name: 'Author', type: 'Link', link_type: 'Entry', required: true, validations: [validation])

      of_type = Contentful::Management::Validation.new
      of_type.link_content_type =  ['media_object', 'text_object']

      items = Contentful::Management::Field.new
      items.type = 'Link'
      items.link_type = 'Entry'
      items.validations = [of_type]
      content_type.fields.create(id: 'blocks', name: 'Blocks', type: 'Array', items: items)

      of_type = Contentful::Management::Validation.new
      of_type.link_content_type =  ['tag']

      items = Contentful::Management::Field.new
      items.type = 'Link'
      items.link_type = 'Entry'
      items.validations = [of_type]
      content_type.fields.create(id: 'tags', name: 'Tags', type: 'Array', items: items)
      content_type.save
      content_type.publish

      with_editor_interfaces do |editor_interfaces|
        editor_interface = editor_interfaces.default(space.id, 'post')
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
      content_type = space.content_types.find('post')
      content_type.unpublish
      content_type.destroy
    end
  end

end