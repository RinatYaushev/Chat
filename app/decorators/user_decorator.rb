class UserDecorator < Draper::Decorator
  delegate_all

  decorates_association :active_relationships
  decorates_association :passive_relationships

  def as_json *args
    super only: %I[id email name gender messages_count pings_count pictures_count purchases_count followers_count followees_count orders_count phone roles],
      methods: %I[avatar active_relationships passive_relationships]
  end

  def avatar
    model.avatar.url :original if model.avatar.present?
  end
end
