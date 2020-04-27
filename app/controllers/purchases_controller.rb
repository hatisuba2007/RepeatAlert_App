class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.where(salon_id: current_salon.id)
    @purchase = Purchase.new
  end

  def create
    @purchase= Purchase.new(purchase_params.merge(salon_id: current_salon.id))
    if @purchase.save
      flash[:success] = "Success!"
      redirect_to "/purchases"
    else
      redirect_to "/purchases"
    end
  end

  def edit
      @purchase=Purchase.find(params[:id])
  end

  def update
      purchase=Purchase.find(params[:id])
      purchase.update(purchase_params)
      redirect_to "/purchases"
  end 

  def destroy
     Purchase.find(params[:id]).destroy
    flash[:success]= "deleted"
    redirect_to "/purchases"
  end

   private

     def purchase_params
      params.require(:purchase).permit(:user_number, :product_number)
     end  
end