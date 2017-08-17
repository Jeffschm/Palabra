class Word < ActiveRecord::Base
  attr_reader :per_page
  @per_page = 7
  attr_writer :inline_forms_attribute_list
  has_paper_trail

  #  default_scope where("name <>'' and NOT ISNULL(name)").order(:name)
  default_scope order(:name)

  belongs_to :source
  belongs_to :user
  belongs_to :goal
  belongs_to :wordtype
  has_many :pictures

  def _presentation
    display = name
    display = "NIET INGEVULD #{id}" if display.blank?
    "#{display}"
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |o|
        csv << o.attributes.values_at(*column_names)
      end
    end
  end

  def inline_forms_attribute_list
    @inline_forms_attribute_list ||= [
      [ :header_woord, '', :header ],
      [ :name , "name", :text_field ],
      [ :wordtype , "source", :dropdown ],
      [ :countable ,'' , :radio_button, { 0 => 'niet ingevuld', 1 => 'no', 2 => 'si' } ],
      [ :attested, "", :radio_button, { 0 => 'niet ingevuld', 1 => 'no', 2 => 'si (2010)' } ],
      [ :attested_on , "attested_on", :date_select ],
      [ :status2, '', :radio_button, { 0 => 'niet ingevuld: verbergen', 1 => 'niet aangenomen: verbergen', 2 => 'aangenomen: weergeven', 3 => 'voorgesteld: weergeven' } ],

      [ :header_herkomst_doel, '', :header ],
      [ :source , "source", :dropdown ],
      [ :goal , "source", :dropdown ],

      [ :header_beschrijving, '', :header ],
      [ :description , "description", :text_area ],
      [ :latin , "description", :text_field ],

      [ :header_vertaling, '', :header ],
      [ :tr_nl , "tr_nl", :text_field ],
      [ :tr_en , "tr_en", :text_field ],
      [ :tr_es , "tr_es", :text_field ],
      [ :tr_pap_cw , "tr_pap_cw", :text_field ],
      [ :tr_pap_aw , "tr_pap_aw", :text_field ],

      [ :header_extra_info, '', :header ],
      [ :tags , "tr_nl", :text_field ],
      [ :picture_url , "tr_en", :text_field ],
      [ :youtube_url , "tr_es", :text_field ],

      [ :pictures, '', :associated ],

      [ :header_info, '', :header ],
      [ :user, '', :info ],

    ]
  end


  def self.not_accessible_through_html?
    false
  end

  def self.order_by_clause
    nil
  end


end
