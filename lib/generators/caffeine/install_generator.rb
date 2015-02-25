require 'rails/generators/active_record/migration'

module Caffeine
  class InstallGenerator < Rails::Generators::Base
    include ActiveRecord::Generators::Migration

    source_root File.expand_path('../templates', __FILE__)

    def copy_caffeine_migrations
      migration_template 'page_migration.rb', 'db/migrate/caffeine_create_pages.rb'
      migration_template 'album_migration.rb', 'db/migrate/caffeine_create_albums.rb'
      migration_template 'picture_migration.rb', 'db/migrate/create_caffeine_pictures.rb'
    end
  end
end
