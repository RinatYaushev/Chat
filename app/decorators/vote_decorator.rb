class VoteDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    {
      id: id,
      kind: kind,
      user_id: user_id
    }
  end
end
