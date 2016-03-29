class CommentDecorator < Draper::Decorator
  delegate_all

  decorates_association :replies

  def as_json *args
    if product_id?
      super only: [:id, :content, :user_id, :product_id], methods: [:replies]
    else
      super only: [:id, :content, :user_id, :parent_id], methods: [:replies]
    end
  end
end
