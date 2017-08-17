class AddStuffToWords < ActiveRecord::Migration
  def change
    add_column :words, :status, :integer, default: 0
    add_column :words, :status2, :integer, default: 0
  end
  
  
end
