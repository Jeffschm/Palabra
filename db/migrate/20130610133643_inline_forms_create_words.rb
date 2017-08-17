class InlineFormsCreateWords < ActiveRecord::Migration

  def self.up
    create_table :words, :id => true do |t|
      t.string :name 
      t.belongs_to :source 
      t.integer :attested 
      t.date :attested_on 
      t.boolean :countable 
      t.belongs_to :user 
      t.text :description 
      t.string :tr_nl 
      t.string :tr_en 
      t.string :tr_es 
      t.string :tr_pap_cw 
      t.string :tr_pap_aw 
      t.string :woordsoort 
      t.string :educatiegebeid 
      t.timestamps
    end
  end

  def self.down
    drop_table :words
  end

end
