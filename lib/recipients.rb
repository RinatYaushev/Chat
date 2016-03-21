class Recipients
  def initialize post
    @post = post
  end

  def emails
    User.joins(:rooms).
      where.not(users: { id: @post.user_id }).
      where(rooms: { id: @post.room_id }).
      pluck(:email)
  end
end
