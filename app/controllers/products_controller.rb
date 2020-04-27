class ProductsController < ApplicationController

  def index
    @products=Product.where(salon_id: current_salon.id)
    @product=Product.new
  end

  def create
    @product = Product.new(product_params.merge(salon_id: current_salon.id))
    if @product.save
      flash[:success] = "Success!"
      redirect_to "/products"
    else
      redirect_to "/products"
    end
  end
  
  def edit
      @product=Product.find(params[:id])
  end
  
  def update
      product=Product.find(params[:id])
      product.update(product_params)
      redirect_to "/products"
  end 
  
  def destroy
     Product.find(params[:id]).destroy
    flash[:success] = "deleted"
    redirect_to "/products"
  end
  
   private
     def product_params
      params.require(:product).permit(:number, :brand, :name, :term)
     end  
end