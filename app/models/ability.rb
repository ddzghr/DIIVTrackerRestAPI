# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user, device = nil)
    # Not logged in users
    can :create, User
    return if user.nil?

    # plain users
    # read or update own user
    can [:read, :update], User,
        id: user.id, user_active: true, user_locked: false, email_confirmed: true
    # read or update own address
    can [:read, :update], Address,
        [ addressable_id: user.id, addressable_type: User.class.name]
    # read or update own roles
    can [:read, :update], UserRole,
        user_id: user.id
    # list couriers
    can [:list_couriers], User,
        user_active: true
    return unless user.admin?
    # admins
    can :manage, :all

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
