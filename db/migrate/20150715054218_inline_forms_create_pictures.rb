class InlineFormsCreatePictures < ActiveRecord::Migration

  def self.up
    create_table :pictures, :id => true do |t|
      t.string :name 
      t.string :caption 
      t.string :image 
      t.text :description 
      t.belongs_to :word 
      t.timestamps
    end
  end

  def self.down
    drop_table :pictures
  end

end
