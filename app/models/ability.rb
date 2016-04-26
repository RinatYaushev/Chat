class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.roles?(:user)
      can [:create, :read], Room do |room|
        room.user_ids.include?(user.id)
      end

      can [:create, :read], Message do |message|
        message.room.user_ids.include?(user.id)
      end

      can [:create, :read], Ping do |ping|
        ping.room.user_ids.include?(user.id)
      end

      can [:create, :read], Picture do |picture|
        picture.room.user_ids.include?(user.id)
      end

      can :read, Product

      can :manage, [Purchase, Order], user_id: user.id

      can [:create, :read], Comment, user_id: user.id

      can [:create, :read], :reply
    end

    if user.roles?(:moderator)
      can :update, [Room, Product]
    end

    if user.roles?(:administrator)
      can :destroy, Room

      can [:create, :destroy], Product
    end
  end
end
