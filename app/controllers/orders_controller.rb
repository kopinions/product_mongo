class OrdersController < ApplicationController
  def create
    user = User.find(params[:user_id])
    order = Order.new(params.require(:order).permit(:name))
    order_items = order_items_params.map { |item| OrderItem.new(item) }
    order.order_items << order_items
    user.orders << order
    response.location = user_order_path user, order
    head 201
  end

  def order_items_params
    params.require(:order).permit(order_items: [:product_id, :quantity])[:order_items]
  end
end
