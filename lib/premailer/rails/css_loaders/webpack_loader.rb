class Premailer
  module Rails
    module CSSLoaders
      module WebpackLoader
        extend self

        def load(url)
          return unless defined?(::Webpacker)
          File.read(File.join('public', Webpacker.manifest.lookup(url)))
        end
      end
    end
  end
end
