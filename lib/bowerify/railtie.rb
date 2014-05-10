module Bowerify
  class Railtie < Rails::Railtie
    railtie_name :bowerify

    config.before_initialize do |app|
      app.config.bower_components_path = Rails.root.join('lib', 'assets', 'components')
      app.config.assets.paths << app.config.bower_components_path

      app.assets.register_preprocessor 'text/css', Bowerify::AssetsProcessor
      app.assets.register_preprocessor 'application/javascript', Bowerify::AssetsProcessor
    end
  end
end
