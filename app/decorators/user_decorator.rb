class UserDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    {
      id: id,
      name: name,
      messages_count: messages_count,
      pings_count: pings_count,
      avatar: { medium: h.image_url(avatar :medium), thumbnail: h.image_url(avatar :thumbnail) }
    }
  end
end
