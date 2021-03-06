class Wordtype < ActiveRecord::Base
  attr_reader :per_page
  @per_page = 7
  attr_writer :inline_forms_attribute_list
  has_paper_trail

  has_many :words

  default_scope order(:name)

  def _presentation
    "#{name}"
  end


  def inline_forms_attribute_list
    @inline_forms_attribute_list ||= [
      [ :name , "name", :text_field ], 
      [ :title_nl , "title_nl", :text_field ], 
      [ :title_en , "title_en", :text_field ], 
      [ :title_es , "title_es", :text_field ], 
      [ :title_pap , "title_pap", :text_field ], 
      [ :comment , "comment", :text_area_without_ckeditor ], 
      [ :words , "comment", :info_list ], 
    ]
  end


  def self.not_accessible_through_html?
    false
  end

  def self.order_by_clause
    nil
  end


end
