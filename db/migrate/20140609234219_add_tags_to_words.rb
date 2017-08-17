class AddTagsToWords < ActiveRecord::Migration
  def change
    add_column :words, :tags, :string
  end
end
