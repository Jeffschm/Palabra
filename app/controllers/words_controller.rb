class WordsController < InlineFormsController
  set_tab :word


  def index
    @objects ||= @Klass
    search = params[:search] || ""
    search = '%' + search.strip + '%'
    @objects = @objects.where("name LIKE ? OR tr_nl LIKE ? OR tr_en LIKE ? OR tr_es LIKE ? OR tr_pap_cw LIKE ? OR tags LIKE ?", search, search, search, search, search, search )
    @objects = @objects.accessible_by(current_ability) if cancan_enabled?
    super
  end

  # override create to get only certain fields
  def create
    @object = @Klass.new
    @object.user = current_user
    super
  end

  def export
   require 'csv'
   @object ||= @Klass
   @objects = @object.order(:name)
   send_data (@objects.to_csv), :type => 'text/csv; charset=UTF-8', :disposition => "attachment; filename=pap_words.csv";
  end

end
