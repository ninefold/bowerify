class Bowerify::AssetsProcessor < Sprockets::Processor
  CSS_URL_RE = /(url\(('|"|))((.+?)\.(gif|png|jpg|jpeg|ttf|svg|woff|eot))(.*?\2\))/

  def evaluate(context, locals={})
    if context.pathname.to_s.starts_with?(bower_components_path)
      fix_assets_path data, context
    else
      data
    end
  end

  def fix_assets_path(data, context)
    data.gsub CSS_URL_RE do |*args|
      s1, s2 = $1.dup, $6.dup

      path = File.expand_path("#{context.pathname.dirname}/#{$3}")
      path = path.gsub("#{bower_components_path}/", "")
      path = context.asset_path(path)

      "#{s1}#{path}#{s2}"
    end
  end

  def bower_components_path
    Rails.application.config.bower_components_path.to_s
  end
end
