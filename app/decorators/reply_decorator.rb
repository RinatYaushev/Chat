class ReplyDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    super only: [:id, :content, :user_id, :comment_id]
  end
end
