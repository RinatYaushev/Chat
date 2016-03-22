class ProductDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    super only: [:id, :name, :price]
  end
end
