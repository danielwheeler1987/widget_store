class StoreController < ApplicationController
  before_action :setup_shopping_cart

  def index
    @widgets = widgets_with_params.page(params[:page]).per(12)
  end

  private

  def widgets_with_params
    if params[:name_term]
      Widget.filter_by_name params[:name_term]
    elsif params[:size_term]
      Widget.filter_by_size params[:size_term]
    elsif params[:color_term]
      Widget.filter_by_color params[:color_term]
    elsif params[:category_term]
      Widget.filter_by_category params[:category_term]
    else
      Widget.available
    end
  end
end
