class PingDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    super only: [:id, :user_id, :room_id]
  end
end
