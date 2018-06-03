class WidgetsController < ApplicationController
  before_action :set_widget, only: [:show, :edit, :update, :destroy]

  def index
    @widgets = Widget.page(params[:page])
  end

  def show
  end

  def new
    @widget = Widget.new
  end

  def edit
  end

  def create
    @widget = Widget.new(widget_params)

    if @widget.save
      redirect_to widgets_url, notice: 'Great! Widget was successfully created.'
    else
      render :new
    end
  end

  def update
    if @widget.update(widget_params)
      redirect_to widgets_url, notice: 'Great! Widget was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @widget.destroy
    redirect_to widgets_url, notice: 'Great! Widget was successfully destroyed.'
  end

  private

  def set_widget
    @widget = Widget.find(params[:id])
  end

  def widget_params
    params.fetch(:widget, {}).permit(:name, :quantity, :color_id, :size_id, :category_id)
  end
end
