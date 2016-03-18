class PictureDecorator < Draper::Decorator
  delegate_all

  decorates_association :user

  decorates_association :room

  def as_json *args
    super only: [:id], methods: [:image, :user, :room]
  end

  def image
    model.image.url :original
  end
end
