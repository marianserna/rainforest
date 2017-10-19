class ProductsController < ApplicationController

  before_action :load_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    @review = Review.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "#{@product.name} has been saved!"
      redirect_to products_path
    else
      flash[:alert] = "Please fix errors"
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "#{@product.name} has been updated"
      redirect_to product_path
    else
      flash[:alert] = "Please fix errors"
      render :edit
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = "#{@product.name} was deleted"
    redirect_to products_path
  end

  private

  def load_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end

end
