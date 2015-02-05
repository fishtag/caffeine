require 'rails/generators/active_record'

module ActiveRecord
  module Generators
    class CaffeineGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def copy_caffeine_migrations
        copy_page_migration
        copy_album_migration
      end

      protected

      def copy_page_migration
        migration_template 'page_migration.rb', 'db/migrate/caffeine_create_page.rb'
      end

      def copy_album_migration
        migration_template 'album_migration.rb', 'db/migrate/caffeine_create_album.rb'
      end
    end
  end
end
