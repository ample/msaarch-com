require 'migration_utils'
class CreateAwards < ContentfulMigrations::Migration

  def up
    with_space do |space|
      content_type = space.content_types.create(
        name: 'Award',
        id: 'award'
      )
      content_type.fields.create(id: 'title', name: 'Title', type: 'Symbol', required: true)
      content_type.fields.create(id: 'body', name: 'Body', type: 'Text', required: true)
      content_type.fields.create(id: 'date', name: 'Date', type: 'Date', required: true)
      content_type.save
      content_type.publish
    end
  end

  def down
    with_space do |space|
      content_type = space.content_types.find('award')
      content_type.unpublish
      content_type.destroy
    end
  end

end