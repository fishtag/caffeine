require 'rails/generators/active_record/migration'

module Caffeine
  class InstallGenerator < Rails::Generators::Base
    include ActiveRecord::Generators::Migration

    source_root File.expand_path('../templates', __FILE__)

    def copy_caffeine_migrations
      migration_template 'page_migration.rb', 'db/migrate/caffeine_create_page.rb'
      migration_template 'album_migration.rb', 'db/migrate/caffeine_create_album.rb'
    end
  end
end
