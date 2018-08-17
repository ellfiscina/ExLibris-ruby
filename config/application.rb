require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Exlibris
  class Application < Rails::Application
    config.load_defaults 5.2
    config.time_zone = 'America/Sao_Paulo'
    config.i18n.enforce_available_locales = false
    config.i18n.available_locales = ['pt-BR']
    config.i18n.load_path += Dir[Rails.root.join('config/locales/**/*.yml').to_s]
    config.i18n.default_locale = :"pt-BR"
    config.encoding = 'utf-8'
    config.assets.initialize_on_precompile = false
  end
end
