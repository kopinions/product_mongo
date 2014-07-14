class ProductsController < ApplicationController
  def index
    head 200
  end

  def create
    product = Product.new(params.require(:product).permit(:name))
    price = Price.new(params.require(:product).permit(price: [:amount])[:price])
    product.price = price
    product.save()
    response.location = product_path product
    head 201
  end
end
