require 'migration_utils'
class AddCarouselImagesToPages < ContentfulMigrations::Migration
  include MigrationUtils

  def up
    with_space do |space|
      content_type = space.content_types.find('page')

      of_type = Contentful::Management::Validation.new
      of_type.link_mimetype_group =  ['image']

      items = Contentful::Management::Field.new
      items.type = 'Link'
      items.link_type = 'Asset'
      items.validations = [of_type]

      content_type.fields.create(id: 'carousel_images', name: 'Carousel Images', type: 'Array', items: items)

      content_type.save
      content_type.publish
    end
  end

  def down
    with_space do |space|
      content_type = space.content_types.find('page')
      field = content_type.fields.detect { |f| f.id == 'carousel_images' }
      field.omitted = true
      field.disabled = true
      content_type.save
      content_type.activate
      content_type.fields.destroy('carousel_images')

    end
  end

end