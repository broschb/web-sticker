class AddSerializeRangeToScribblets < ActiveRecord::Migration
  def change
    add_column :scribblets, :serialize_range, :string
  end
end
