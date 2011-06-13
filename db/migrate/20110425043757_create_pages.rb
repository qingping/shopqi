#encoding: utf-8
class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.integer :shop_id  , comment: '所属网店'
      t.string :title     , comment: '标题'
      t.boolean :published, comment: '是否可见'                    , default: false
      t.string :handle    , comment: '用于模板中的Permalink/Handle', null: false
      t.text :body_html   , comment: '内容'
      t.boolean :delta    , comment: "ts全文检索增量更新标记"      , null: false   , default: true

      t.timestamps
    end

    add_index :pages, :shop_id
    add_index :pages, :delta
  end

  def self.down
    drop_table :pages
  end
end
