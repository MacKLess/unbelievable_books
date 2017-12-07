class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    @featured = Product.featured
    @discounted = Product.discounted
    @products = Product.alphabetical
  end

  def show
    @product = Product.find(params[:id])
    @order_item = OrderItem.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      respond_to do |format|
        format.html {
          flash[:notice] = "Product created!"
          redirect_to product_path(@product)
        }
        format.js
      end
    else
      flash[:alert] = @product.errors.full_messages
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product updated successfully."
      redirect_to product_path(@product)
    else
      flash[:alert] = @product.errors.full_messages
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product has sucked into a black hole."
    redirect_to products_path
  end

private
  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity, :author, :featured, :discount, :discount_end)
  end
end
