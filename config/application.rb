require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
require 'carrierwave/orm/activerecord'

module Refugees
  class Application < Rails::Application

    config.middleware.use Rack::Cors do
      allow do
        origins "*"
        resource "*", headers: :any, methods: [:get, :post, :patch, :delete, :options]
      end
    end
    
    config.middleware.delete Rack::Lock
    
    config.active_record.raise_in_transactional_callbacks = true
#    config.autoload_paths += %W(#{config.root}/lib)

  end
end
