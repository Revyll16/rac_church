class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    generated_password = SecureRandom.alphanumeric(8)
    @user.password = generated_password

    if @user.save
      @user.add_role(params[:role]) if params[:role].present?
      # Envoyer un email avec le mot de passe généré
      UserMailer.welcome_email(@user, generated_password).deliver_later
      redirect_to @user, notice: 'Utilisateur créé avec succès.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      @user.roles.destroy_all
      @user.add_role(params[:role]) if params[:role].present?
      redirect_to @user, notice: 'Utilisateur mis à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'Utilisateur supprimé avec succès.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :phone_number, :active)
  end

  def authorize_admin
    unless current_user.admin?
      redirect_to root_path, alert: "Vous n'êtes pas autorisé à accéder à cette page."
    end
  end
end 