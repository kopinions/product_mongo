class OrdersController < ApplicationController
  def create
    user = User.find(params[:user_id])
    order = Order.new(params.require(:order).permit(:name))
    user.orders << order
    response.location = user_order_path user, order
    head 201
  end
end
