class AddPictureUrlToWords < ActiveRecord::Migration
  def change
    add_column :words, :picture_url, :string
  end
end
