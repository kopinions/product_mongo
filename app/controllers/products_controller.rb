class ProductsController < ApplicationController
  def index
    head 200
  end

  def create
    product = Product.new(params.require(:product).permit(:name))
    product.save()
    puts product.inspect
    response.location = product_path product
    head 201
  end
end
