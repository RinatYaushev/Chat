class RoomBuilder
  attr_reader :user_ids, :params, :room

  delegate :decorate, to: :room

  def initialize user, params = {}
    @user_ids = params.delete(:user_ids).push(user.id)

    @params = params
  end

  def save!
    build_room

    build_memberships

    room.save!
  end

  private

  def build_room
    @room = Room.new(params)
  end

  def build_memberships
    user_ids.each do |id|
      room.memberships.build(user_id: id)
    end
  end
end
