module SessionsHelper

  # 渡されたユーザーでログインする
  def log_in(salon)
    session[:salon_id] = salon.id
  end

  def remember(salon)
    salon.remember
    cookies.permanent.signed[:salon_id] = salon.id
    cookies.permanent[:remember_token] = salon.remember_token
  end

  def current_salon?(salon)
    salon == current_salon
  end

  def current_salon
    if (salon_id = session[:salon_id])
      @current_salon ||= Salon.find_by(id: salon_id)
    elsif (salon_id = cookies.signed[:salon_id])
      salon = Salon.find_by(id: salon_id)
      if salon && salon.authenticated?(cookies[:remember_token])
        log_in salon
        @current_salon = salon
      end
    end
  end
  
  def logged_in?
    !current_salon.nil?
  end
  
  def log_out
    session.delete(:salon_id)
    @current_salon = nil
  end  
  # 永続的セッションを破棄する
  def forget(salon)
    salon.forget
    cookies.delete(:salon_id)
    cookies.delete(:remember_token)
  end

  # 現在のユーザーをログアウトする
  def log_out
    forget(current_salon)
    session.delete(:salon_id)
    @current_salon = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end


end