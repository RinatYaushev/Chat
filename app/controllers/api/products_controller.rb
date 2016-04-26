class Api::ProductsController < ApplicationController
  load_and_authorize_resource

  private

  def collection
    @products
  end

  def build_resource
    @product
  end

  def resource
    @product
  end

  def resource_params
    params.require(:product).permit(:name, :price)
  end
end
