class CommentDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    super only: [:id, :content, :user_id, :product_id, :comment_id]
  end
end
