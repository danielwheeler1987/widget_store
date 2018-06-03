class StoreController < ApplicationController
  def index
    @widgets = Widget.order(:name).page(params[:page]).per(12)
  end
end
