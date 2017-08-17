class AddYoutubeUrlToWords < ActiveRecord::Migration
  def change
    add_column :words, :youtube_url, :string
  end
end
