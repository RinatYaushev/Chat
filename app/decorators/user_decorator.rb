class UserDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    super only: [:id, :name, :messages_count, :pings_count, :pictures_count], methods: [:avatar]
  end

  def avatar
    model.avatar.url :original
  end
end
