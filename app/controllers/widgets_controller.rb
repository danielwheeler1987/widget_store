class WidgetsController < ApplicationController
  before_action :set_widget, only: [:show, :edit, :update, :destroy]

  def index
    @widgets = Widget.page(params[:page])
    respond_to :html, :json
  end

  def show
    respond_to :html, :json
  end

  def new
    @widget = Widget.new
  end

  def edit
  end

  def create
    @widget = Widget.new(widget_params)

    respond_to do |format|
      if @widget.save
        format.html { redirect_to widgets_url, notice: 'Great! Widget was successfully created.' }
        format.json { render :show, status: :created, location: @widget }
      else
        format.html { render :new }
        format.json { render json: @widget.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @widget.update(widget_params)
        format.html { redirect_to widgets_url, notice: 'Great! Widget was successfully updated.' }
        format.json { render :show, status: :ok, location: @widget }
      else
        format.html { render :edit }
        format.json { render json: @widget.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @widget.destroy
    respond_to do |format|
      format.html { redirect_to widgets_url, notice: 'Great! Widget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_widget
    @widget = Widget.find(params[:id])
  end

  def widget_params
    params.fetch(:widget, {}).permit(:name, :quantity, :color_id, :size_id, :category_id)
  end
end
