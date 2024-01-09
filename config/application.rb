require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CarHub
  class Application < Rails::Application
    config.load_defaults 7.0

    # Include Bootstrap assets in the asset pipeline
    config.assets.paths << Rails.root.join('node_modules', 'bootstrap', 'dist', 'css')

    # Autoload / Load paths for custom directories
    config.autoload_paths += %W(#{config.root}/lib)
    config.eager_load_paths += %W(#{config.root}/lib)

    # Other configurations...
  end
end

