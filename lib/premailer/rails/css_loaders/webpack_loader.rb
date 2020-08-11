class Premailer
  module Rails
    module CSSLoaders
      module WebpackLoader
        extend self

        def load(url)
          return unless defined?(::Webpacker)

          asset_url = Webpacker.manifest.lookup(url.to_s)

          File.read(File.join('public', asset_url)) if asset_url.present?
        end
      end
    end
  end
end
