class ShoppingCartItemsController < ApplicationController
  before_action :setup_shopping_cart
  before_action :set_order_item, only: [:destroy]

  def create
    @order_item = OrderItem.new(order_item_params.merge(order: @current_order, quantity: 1))

    if @order_item.save
      redirect_to store_index_url, notice: 'Great! A widget was successfully added to your shopping cart.'
    else
      redirect_to store_index_url
    end
  end

  def destroy
    @order_item.destroy
    redirect_to order_url(@current_order), notice: 'Great! We removed that widget from your shopping cart'
  end

  private

  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end

  def order_item_params
    params.fetch(:order_item, {}).permit(:widget_id)
  end
end
