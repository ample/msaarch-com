require 'migration_utils'
class AddInactiveFlagToUsers < ContentfulMigrations::Migration

  def up
    with_space do |space|
      content_type = space.content_types.find('user')
      content_type.fields.create(id: 'inactive', name: 'Inactive?', type: 'Boolean')
      content_type.save
      content_type.publish
    end
  end

  def down
    with_space do |space|
      content_type = space.content_types.find('user')
      field = content_type.fields.detect { |f| f.id == 'inactive' }
      field.omitted = true
      field.disabled = true
      content_type.save
      content_type.activate
      content_type.fields.destroy('inactive')
    end
  end
end
