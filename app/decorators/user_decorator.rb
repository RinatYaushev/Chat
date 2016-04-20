class UserDecorator < Draper::Decorator
  delegate_all

  decorates_association :active_relationships
  decorates_association :passive_relationships

  def as_json *args
    super only: %I[id email name gender messages_count pings_count pictures_count purchases_count orders_count phone],
      methods: %I[avatar followers_count followees_count active_relationships passive_relationships]
  end

  def avatar
    model.avatar.url :original
  end

  def followers_count
    followers.count
  end

  def followees_count
    followees.count
  end
end
