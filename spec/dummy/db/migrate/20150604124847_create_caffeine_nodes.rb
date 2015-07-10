class CreateCaffeineNodes < ActiveRecord::Migration
  def change
    enable_extension :hstore

    create_table 'caffeine_nodes' do |t|
      t.string   'type'
      t.string   'title'
      t.string   'slug'
      t.integer  'parent_id'
      t.integer  'position'
      t.hstore   'data'

      t.datetime 'created_at'
      t.datetime 'updated_at'
    end

    add_index 'caffeine_nodes', ['slug'], name: 'index_nodes_on_slug', using: :btree

    create_table 'caffeine_node_hierarchies', id: false do |t|
      t.integer 'ancestor_id',   null: false
      t.integer 'descendant_id', null: false
      t.integer 'generations',   null: false
    end

    add_index 'caffeine_node_hierarchies', ['ancestor_id', 'descendant_id', 'generations'], name: 'node_anc_desc_udx', unique: true, using: :btree
    add_index 'caffeine_node_hierarchies', ['descendant_id'], name: 'node_desc_idx', using: :btree
  end
end
