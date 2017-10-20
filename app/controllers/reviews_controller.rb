class ReviewsController < ApplicationController

  before_action :require_login
  before_action :load_product
  before_action :load_review, only: [:edit, :update, :destroy]

  def create
    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:notice] = "Review has been saved!"
      redirect_to product_path(@product)
    else
      flash[:alert] = "Please fix errors"
      render :product_path
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      flash[:notice] = "Review has been updated"
      redirect_to product_path(@product)
    else
      flash[:alert] = "Please fix errors"
      render :edit
    end
  end

  def destroy
    @review.destroy
    flash[:notice] = "Review was deleted"
    redirect_to product_path(@product)
  end

  private

  def load_review
    @review = @product.reviews.find_by!(id: params[:id], user_id: current_user.id)
  end

  def review_params
    params.require(:review).permit(:comment, :product_id)
  end

  def load_product
    @product = Product.find(params[:product_id])
  end
end
