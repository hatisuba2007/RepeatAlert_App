class UsersController < ApplicationController
  
  def index
    @users = User.where(salon_id: current_salon.id)
    @user= User.new
  end


  def create
    @user= User.new(user_params.merge(salon_id: current_salon.id))
    if @user.save
      flash[:notice] = "Success!"
      redirect_to "/users"
    else
      redirect_to "/users"
    end
  end
  
  def edit
      @user=User.find(params[:id])
  end
  
  def update
      user=User.find(params[:id])
      user.update(user_params)
      redirect_to "/users"
  end   

  def destroy
     User.find(params[:id]).destroy
    flash[:success] = "deleted"
    redirect_to "/users"
  end  
  
   private
   
     def user_params
      params.require(:user).permit(:number, :name, :email)
     end
end