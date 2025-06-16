module Admin
  class UsersController < Admin::BaseController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
      @users = User.all.order(created_at: :desc)
    end

    def show
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to admin_user_path(@user), notice: 'Utilisateur créé avec succès.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @user.update(user_params)
        redirect_to admin_user_path(@user), notice: 'Utilisateur mis à jour avec succès.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @user.destroy
      redirect_to admin_users_path, notice: 'Utilisateur supprimé avec succès.'
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :role, :phone_number, :address, :birth_date)
    end
  end
end 