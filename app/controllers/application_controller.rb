class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  private

  def setup_shopping_cart
    @current_order = Order.find(session[:current_order_id])
  rescue ActiveRecord::RecordNotFound
    @current_order = Order.create
    session[:current_order_id] = @current_order.id
  end
end
