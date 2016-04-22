class Recipients
  def initialize post
    @post = post
  end

  def users
    User.joins(:rooms).
      where.not(users: { id: @post.user_id }).
      where(rooms: { id: @post.room_id })
  end
end
