class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, User
    can :manage, User, id: user.id
    can :manage, Room do |room|
      room.user_ids.include?(user.id)
    end
    can :manage, Message do |message|
      message.room.user_ids.include?(user.id)
    end
  end
end
