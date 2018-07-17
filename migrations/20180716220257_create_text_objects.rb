require 'migration_utils'
class CreateTextObjects < ContentfulMigrations::Migration

  def up
    with_space do |space|
      content_type = space.content_types.create(
        name: 'Text Object',
        id: 'text_object'
      )
      content_type.fields.create(id: 'title', name: 'Title', type: 'Symbol', required: true)
      content_type.fields.create(id: 'body', name: 'Body', type: 'Text')
      content_type.fields.create(id: 'css', name: 'CSS Selectors', type: 'Symbol')

      content_type.save
      content_type.publish
    end
  end

  def down
    with_space do |space|
      content_type = space.content_types.find('text')
      content_type.unpublish
      content_type.destroy
    end
  end

end