class Api::ProductsController < ApplicationController
  private

  def collection
    @products ||= Product.all
  end

  def build_resource
    @product = Product.new(resource_params)
  end

  def resource
    @product ||= Product.find(params[:id])
  end

  def resource_params
    params.require(:product).permit(:name, :price)
  end
end
