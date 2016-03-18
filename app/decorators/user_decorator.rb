class UserDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    {
      id: id,
      name: name,
      messages_count: messages_count,
      pings_count: pings_count,
      avatar: h.image_url(avatar :original)
    }
  end
end
