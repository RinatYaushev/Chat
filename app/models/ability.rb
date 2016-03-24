class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, Room do |room|
      room.user_ids.include?(user.id)
    end

    can :manage, Message do |message|
      message.room.user_ids.include?(user.id)
    end

    can :manage, Ping do |ping|
      ping.room.user_ids.include?(user.id)
    end

    can :manage, Picture do |picture|
      picture.room.user_ids.include?(user.id)
    end

    can :manage, Order, user_id: user.id
  end
end
