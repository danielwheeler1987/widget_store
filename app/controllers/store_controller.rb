class StoreController < ApplicationController
  def index
    @widgets = Widget.available
                     .order(:name)
                     .page(params[:page])
                     .per(12)
  end
end
