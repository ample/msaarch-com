require 'migration_utils'
class CreateMediaObjects < ContentfulMigrations::Migration

  def up
    with_space do |space|
      content_type = space.content_types.create(
        name: 'Media Object',
        id: 'media_object'
      )
      content_type.fields.create(id: 'title', name: 'Title', type: 'Symbol', required: true)
      content_type.fields.create(id: 'body', name: 'Body', type: 'Text')
      content_type.fields.create(id: 'image', name: 'Image', type: 'Link', link_type: 'Asset')

      content_type.save
      content_type.publish
    end
  end

  def down
    with_space do |space|
      content_type = space.content_types.find('media_object')
      content_type.unpublish
      content_type.destroy
    end
  end

end