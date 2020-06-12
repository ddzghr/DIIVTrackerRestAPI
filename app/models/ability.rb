# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user, device = nil)
    # Not logged in users
    return if user.nil?

    # users cannot touch domains
    cannot :manage, AddressType
    cannot :manage, Role
    cannot :manage, DeviceType
    cannot :manage, RoleDeviceType
    cannot :manage, Status
    cannot :manage, Workflow

    # plain users
    # read or update own user
    can %i[read update], User,
        id: user.id, user_active: true, user_locked: false, email_confirmed: true
    # read or update own address
    can %i[read update], Address,
        [addressable_id: user.id, addressable_type: 'User']
    # read and create own roles
    can %i[read create destroy], UserRole, user_id: user.id

    # User can have multiple roles
    if user.orderer?
      can %i[read], Delivery
      can %i[read], DeliveryStatus
    end

    if user.supplier?
      can %i[read create], Delivery
      can %i[read create], Device, user_id: user.id
      can %i[read create cancel], DeliveryStatus
      can %i[read], GpsLocation
    end

    if user.courier?
      can %i[read], Delivery
      can %i[read create], Device, user_id: user.id
      can %i[read], DeliveryStatus
      can %i[read], GpsLocation
    end

    unless device.nil?
      # All devices
      can :fetch_owner, User
      can %i[read create], GpsLocation
      can %i[read], Device, id: device.id

      if device.desktop?
        can [:list_couriers], User, user_active: true
        can %i[read create], Delivery
        can %i[read create cancel], DeliveryStatus
      elsif device.mobile?
        can :read, Delivery
        can %i[read pickup accept reject deliver lost], DeliveryStatus
      elsif device.web_server?
        can %i[read accept store assign reject deliver lost], DeliveryStatus
        can %i[read], Device, user_id: user.id
      elsif device.internal_web_server? || device.internal_api_server?
        # Domains
        can :read, AddressType
        can :read, Role
        can :read, DeviceType
        can :read, RoleDeviceType
        can :read, Status
        can :read, Workflow
        # Others
        can %i[read create list_couriers], User
      end
    end

    return unless user.admin?
    # admins
    can :manage, :all

    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
