Rails.application.config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]
Rails.application.config.i18n.default_locale = :ru
