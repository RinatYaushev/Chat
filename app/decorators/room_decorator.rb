class RoomDecorator < Draper::Decorator
  delegate_all

  decorates_association :users

  def as_json *args
    super only: [:id, :name], methods: [:users]
  end
end
