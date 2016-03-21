class MessageDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    super only: [:id, :content, :user_id, :room_id]
  end
end
