class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
    before_action :set_current_salon
  
  def set_current_salon
    @current_salon = Salon.find_by(id: session[:salon_id])
  end
end