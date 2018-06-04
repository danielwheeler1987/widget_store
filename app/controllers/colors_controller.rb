class ColorsController < ApplicationController
  before_action :set_color, only: [:show, :update, :destroy]

  def index
    @colors = Color.all
  end

  def show
  end

  def create
    @color = Color.new(color_params)

    if @color.save
      render :show, status: :created, location: @color
    else
      render json: @color.errors, status: :unprocessable_entity
    end
  end

  def update
    if @color.update(color_params)
      render :show, status: :ok, location: @color
    else
      render json: @color.errors, status: :unprocessable_entity 
    end
  end

  def destroy
    @color.destroy
    head :no_content
  end

  private

  def set_color
    @color = Color.find(params[:id])
  end

  def color_params
    params.fetch(:color, {}).permit(:name)
  end
end
