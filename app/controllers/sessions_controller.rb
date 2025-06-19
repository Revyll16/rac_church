class SessionsController < ApplicationController
  layout 'sessions', only: [:new, :create]

  def new
    redirect_to admin_dashboard_path if current_user&.has_role?(:admin)
    redirect_to member_dashboard_path if current_user&.has_role?(:member)
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      user.update(last_login_at: Time.current, last_login_ip: request.remote_ip)
      
      if user.has_role?(:admin)
        redirect_to admin_dashboard_path, notice: 'Connexion réussie!'
      else
        redirect_to member_dashboard_path, notice: 'Connexion réussie!'
      end
    else
      flash.now[:alert] = 'Email ou mot de passe incorrect'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Déconnexion réussie!'
  end

  private

  def authenticate_user
    unless logged_in?
      flash[:alert] = "Vous devez être connecté pour accéder à cette page"
      redirect_to login_path
    end
  end
end 