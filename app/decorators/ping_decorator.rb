class PingDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    {
      id: id,
      user_id: user_id,
      room_id: room_id
    }
  end
end
