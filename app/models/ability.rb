class Ability
  include CanCan::Ability

  def initialize(user)
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities

    user ||= user.new # guest user
    alias_action(:read, :create, :update, :to => :all_but_delete)

    if user.role? :superadmin
      can :access, :all
    elsif user.role? :admin
      can   :all_but_delete,          :words
      can   :read,                    DROPDOWN_LISTS
      can   :export, :words
      can   :all_but_delete,          :users
      cannot :update,                  :users, :id => 1
    elsif user.role? :editor
      can   :all_but_delete,          :words
      can   :read,                    DROPDOWN_LISTS
      can   :read,                    :users, id: user.id
    elsif user.role? :reader
      can   :read,                    :words
      can   :read,                    DROPDOWN_LISTS
      can   :read,                    :users, id: user.id

      # put restrictions for other users here
    end
  end
end
