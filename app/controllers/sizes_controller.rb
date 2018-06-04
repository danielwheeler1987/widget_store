class SizesController < ApplicationController
  before_action :set_size, only: [:show, :update, :destroy]

  def index
    @sizes = Size.all
  end

  def show
  end

  def create
    @size = Size.new(size_params)

    if @size.save
      render :show, status: :created, location: @size
    else
      render json: @size.errors, status: :unprocessable_entity
    end
  end

  def update
    if @size.update(size_params)
      render :show, status: :ok, location: @size
    else
      render json: @size.errors, status: :unprocessable_entity 
    end
  end

  def destroy
    @size.destroy
    head :no_content
  end

  private

  def set_size
    @size = Size.find(params[:id])
  end

  def size_params
    params.fetch(:size, {}).permit(:name)
  end
end
