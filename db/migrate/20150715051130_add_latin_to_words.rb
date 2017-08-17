class AddLatinToWords < ActiveRecord::Migration
  def change
    add_column :words, :latin, :string
  end
end
