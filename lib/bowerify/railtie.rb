module Bowerify
  class Railtie < Rails::Railtie
    railtie_name :bowerify

    config.before_initialize do |app|
      app.config.bower_components_path = [
        Rails.root.join('lib', 'assets', 'components'),
        Rails.root.join('vendor', 'assets', 'components')
      ]

      app.assets.register_preprocessor 'text/css', Bowerify::AssetsProcessor
      app.assets.register_preprocessor 'application/javascript', Bowerify::AssetsProcessor
    end

    config.after_initialize do |app|
      app.config.assets.paths += Array(app.config.bower_components_path)

      %w[png gif jpg jpeg ttf svg eot woff].each do |ext|
        Array(app.config.bower_components_path).each do |bower_path|
          config.assets.precompile += Dir.glob("#{bower_path}/**/*.#{ext}")
        end
      end
    end
  end
end
