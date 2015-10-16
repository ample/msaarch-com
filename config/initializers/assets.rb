# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( public/blueprint/screen.css public/blueprint/print.css public/blueprint/ie.css admin/blueprint/screen.css admin/blueprint/print.css admin/blueprint/ie.css ample_admin.css admin/admin.css ample_admin.js admin/admin.js public/pdf.css public/video-overlays.css)
