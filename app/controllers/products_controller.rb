class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).all
  end
  def show
    @product = Product.find(params[:id])
  end
  #This loads a single product by its id into the @product instance variable, to show details of a single product.
end
