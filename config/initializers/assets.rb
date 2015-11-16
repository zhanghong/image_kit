# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( style.css bootstrap.min.css jquery-1.11.3.min.js jquery-ui.js jquery.data-selector.min.js modernizr-2.8.3.min.js html5shiv.min.js respond.min.js bootstrap.min.js custom_min.js masonry.pkgd.min.js imagesloaded.pkgd.min.js main.js)
