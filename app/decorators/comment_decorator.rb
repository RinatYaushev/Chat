class CommentDecorator < Draper::Decorator
  delegate_all

  decorates_association :replies

  def as_json *args
    super only: [:id, :content, :user_id, :product_id, :comment_id], methods: [:replies]
  end
end
