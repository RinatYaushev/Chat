class VoteDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    super only: [:id, :kind, :user_id]
  end
end
