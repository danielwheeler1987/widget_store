class OrdersController < ApplicationController
  before_action :set_order

  def show
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def widget_params
    params.fetch(:order, {})
  end
end
