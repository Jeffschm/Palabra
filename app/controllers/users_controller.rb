class UsersController < InlineFormsController
  set_tab :user

  # override index to scope @Klass
  def index
    @objects ||= @Klass

    search = params[:search] || ""
    search = '%' + search + '%'

    @objects            = @objects.where("name LIKE ? OR email LIKE ? ", search, search )
    @objects            = @objects.accessible_by(current_ability) if cancan_enabled?

    super
  end

  # override new to get only certain fields
  def new
    @object = @Klass.new
    @inline_forms_attribute_list = [
      [ :name , 'name', :text_field ],
      [ :email , 'email', :text_field ],
      [ :password , 'Nieuw wachtwoord', :devise_password_field ],
      [ :roles, '', :check_list ],
    ]
    super
  end

  # override create to get only certain fields
  def create
    @object = @Klass.new
    filter_roles
    @inline_forms_attribute_list = [
      [ :name , 'name', :text_field ],
      [ :email , 'email', :text_field ],
      [ :password , 'Nieuw wachtwoord', :devise_password_field ],
      [ :roles, '', :check_list ],
    ]
    super
  end

  def update
    filter_roles unless current_user.role? :superadmin
    super
  end

  private

  def filter_roles
    FORBIDDEN_ROLES_FOR_ADMIN.each do |forbidden_role|
      params[:roles].delete(forbidden_role) unless params[:roles].nil?
    end
  end

end
