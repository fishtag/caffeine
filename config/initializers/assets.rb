Caffeine::Engine.config.assets.paths << "#{Rails.root}/app/assets/fonts"
Caffeine::Engine.config.assets.precompile += %w(iconsfont.eot iconsfont.svg iconsfont.ttf iconsfont.woff)
Caffeine::Engine.config.assets.precompile += %w(caffeine/admin.js caffeine/admin.css)
Caffeine::Engine.config.assets.precompile += %w(caffeine/sessions.css)
Caffeine::Engine.config.assets.precompile += %w(bootstrap/bootstrap.min.css bootstrap/bootstrap.min.js)
