class FinalizeCheckoutController < ApplicationController
  before_action :setup_shopping_cart

  def index
    empty_session!
    redirect_to store_index_url, notice: 'Wowzers Batman! We just processed your fake order.'
  end

  private

  def empty_session!
    session[:current_order_id] = nil
  end
end
