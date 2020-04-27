class SalonsController < ApplicationController
  before_action :logged_in_salon, only: [:edit, :update]  
  before_action :correct_user,   only: [:edit, :update]
  def show
    @salon = Salon.find(params[:id])
  end
 
  def new
    @salon = Salon.new
  end

  def create
    @salon = Salon.new(salon_params)   
    if @salon.save
       log_in @salon
      flash[:success] = "Welcome!"
      redirect_to "/"
    else
      redirect_to "/"
    end
  end
  
  def edit
    @salon = Salon.find(params[:id])
  end
  
  def update
    @salon = Salon.find(params[:id])
    if @salon.update_attributes(salon_params)
      flash[:success] = "Profile updated"
      redirect_to "/top"
    else
      render 'edit'
    end
  end  
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  
  
  private

    def salon_params
      params.require(:salon).permit(:name, :email, :password,
                                   :password_confirmation)  
    end
   
    def logged_in_salon
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_salon
      @salon = Salon.find(params[:id])
      redirect_to(root_url) unless current_salon?(@salon)
    end

end