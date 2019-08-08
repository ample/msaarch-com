require 'migration_utils'
class AddCarouselImagesToPages < ContentfulMigrations::Migration
  include MigrationUtils

  def up
    with_space do |space|
      content_type = space.content_types.create(
        name: 'Carousel Image',
        id: 'carousel_image',
        description: 'Carousel image to display at top of home page'
      )

      content_type.fields.create(id: 'title', name: 'title', type: 'Symbol', required: true)
      content_type.fields.create(id: 'image', name: 'Image', type: 'Link', link_type: 'Asset', required: true)

      content_type.save
      content_type.publish

      content_type = space.content_types.find('page')

      content_type.fields.create(id: 'carousel_images', name: 'Carousel Images', type: 'Array', items: items_of_type('Carousel Image', 'carousel_images'))


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

      child_content_type = space.content_types.find('carousel_image')
      child_content_type.unpublish
      child_content_type.destroy
    end
  end

end