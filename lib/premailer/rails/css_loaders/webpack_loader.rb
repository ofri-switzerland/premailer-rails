class Premailer
  module Rails
    module CSSLoaders
      module WebpackLoader
        extend self
        extend ActionView::Helpers::AssetUrlHelper

        def load(url)
          return unless defined?(::Webpacker)

          path = Webpacker.manifest.lookup(url)
          return unless path

          if Webpacker.config.compile?
            URI.open(url_to_asset(path)).read
          else
            File.join(Webpacker.config.public_path, path).read
          end
        end
      end
    end
  end
end
