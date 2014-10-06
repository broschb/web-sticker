class CreateStickers < ActiveRecord::Migration
  def change
    create_table :stickers do |t|
      t.references :user, index: true
      t.references :site, index: true
      t.string :page_url
      t.string :selected_text
      t.string :notes

      t.timestamps
    end
  end
end
