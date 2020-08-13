class Premailer
  module Rails
    module CSSLoaders
      module WebpackLoader
        extend self

        def load(url)
          return unless defined?(::Webpacker)

          path = Webpacker.manifest.lookup(url)
          return unless path

          unless Webpacker.config.compile?
            File.open(File.join(Webpacker.config.public_path, path)).read
          end
        end
      end
    end
  end
end
