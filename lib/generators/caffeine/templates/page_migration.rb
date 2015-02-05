class CreatePages < ActiveRecord::Migration
  create_table 'pages' do |t|
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

  add_index 'pages', ['slug'], name: 'index_pages_on_slug', using: :btree

  create_table 'page_hierarchies', id: false do |t|
    t.integer 'ancestor_id',   null: false
    t.integer 'descendant_id', null: false
    t.integer 'generations',   null: false
  end

  add_index 'page_hierarchies', ['ancestor_id', 'descendant_id', 'generations'], name: 'page_anc_desc_udx', unique: true, using: :btree
  add_index 'page_hierarchies', ['descendant_id'], name: 'page_desc_idx', using: :btree
end
