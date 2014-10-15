  class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :base_url
      t.timestamps
    end

    create_table :pages do |t|
      t.references :site, index: true
      t.string :page_url
      t.string :page_name
      t.timestamps
    end

    create_table :scribblets do |t|
      t.references :user, index: true
      t.references :page, index: true
      t.string :selected_text
      t.string :notes

      t.timestamps
    end

    add_index :pages, [:site_id, :page_url]
  end
end
