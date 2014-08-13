class Bowerify::AssetsProcessor < Sprockets::Processor
  CSS_URL_RE = /(url\(('|"|))((.+?)\.(gif|png|jpg|jpeg|ttf|svg|woff|eot))(.*?\2\))/

  def evaluate(context, locals={})
    if bower_component?(context.pathname)
      fix_assets_path data, context
    else
      data
    end
  end

  def fix_assets_path(data, context)
    data.gsub CSS_URL_RE do |*args|
      s1, s2 = $1.dup, $6.dup

      path = File.expand_path("#{context.pathname.dirname}/#{$3}")
      bower_components_paths.each do |bower_path|
        path = path.gsub("#{bower_path}/", "")
      end
      path = context.asset_path(path)

      "#{s1}#{path}#{s2}"
    end
  end

  def bower_component?(path)
    bower_components_paths.each do |bower_path|
      if path.to_s.starts_with?(bower_path)
        return true
      end
    end

    false
  end

  def bower_components_paths
    Array(Rails.application.config.bower_components_path).map(&:to_s)
  end
end
