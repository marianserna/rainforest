class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User has been saved!"
      redirect_to products_url
    else
      flash[:alert] = "Please fix errors"
      render :new
    end
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      flash[:notice] = "User has been updated"
      redirect_to products_path
    else
      flash[:alert] = "Please fix errors"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
end
