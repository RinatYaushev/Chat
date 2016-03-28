class UserDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    super only: [:id, :email, :name, :gender, :messages_count, :pings_count, :pictures_count, :purchases_count, :orders_count, :phone],
      methods: [:avatar]
  end

  def avatar
    model.avatar.url :original
  end
end
