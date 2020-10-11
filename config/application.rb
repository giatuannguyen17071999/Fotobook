require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Fotobook
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.assets.enabled = true
    config.assets.paths << Rails.root.join("app", "assets", "fonts","css")
    config.assets.paths << Rails.root.join("app", "assets", "stylesheets", "admin")
    config.assets.paths << Rails.root.join("app", "assets", "stylesheets", "album")
    config.assets.paths << Rails.root.join("app", "assets", "stylesheets", "photo")
    config.assets.paths << Rails.root.join("app", "assets", "stylesheets", "user")
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
