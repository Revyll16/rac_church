module Member
  class BaseController < ApplicationController
    before_action :require_login
    before_action :require_member
    layout 'member'
  
    # TODO: Implémenter une nouvelle solution d'authentification
    # Pour l'instant, on désactive la vérification de membre
    # before_action :authenticate_member!

    private

    def require_member
      unless current_user&.member?
        flash[:alert] = "Vous n'avez pas les droits d'accès à cette section."
        redirect_to root_path
      end
    end
  end
end 