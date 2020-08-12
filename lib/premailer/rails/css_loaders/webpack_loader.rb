class Premailer
  module Rails
    module CSSLoaders
      module WebpackLoader
        extend self

        def load(url)
          return unless defined?(::Webpacker)

          path = Webpacker.manifest.lookup(url)
          return unless path

          if Webpacker.config.compile?
            URI.open(url_to_asset(path)).read
          else
            Webpacker.config.public_output_path.join(path).read
          end
        end
      end
    end
  end
end
