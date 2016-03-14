class RoomDecorator < Draper::Decorator
  delegate_all

  decorates_association :users

  def as_json params = {}
    {
      id: id,
      name: name
    }.tap do |hash|
      hash[:users] = users unless params[:brief]
    end
  end
end
