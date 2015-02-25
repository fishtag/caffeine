class CaffeineCreatePages < ActiveRecord::Migration
  def change
    create_table 'caffeine_pages' do |t|
      t.string   'title'
      t.text     'content'
      t.text     'summary'
      t.string   'slug'
      t.boolean  'fix_slug', default: false
      t.integer  'status', default: 0
      t.integer  'parent_id'
      t.integer  'position'
      t.boolean  'main', default: false
      t.datetime 'created_at'
      t.datetime 'updated_at'
    end

    add_index 'caffeine_pages', ['slug'], name: 'index_pages_on_slug', using: :btree

    create_table 'caffeine_page_hierarchies', id: false do |t|
      t.integer 'ancestor_id',   null: false
      t.integer 'descendant_id', null: false
      t.integer 'generations',   null: false
    end

    add_index 'caffeine_page_hierarchies', ['ancestor_id', 'descendant_id', 'generations'], name: 'page_anc_desc_udx', unique: true, using: :btree
    add_index 'caffeine_page_hierarchies', ['descendant_id'], name: 'page_desc_idx', using: :btree
  end
end
