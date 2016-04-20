class RelationshipDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    super only: [:id, :follower_id, :followee_id]
  end
end
