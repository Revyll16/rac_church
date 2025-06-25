module Admin
  class BaseController < ApplicationController
    before_action :require_login
    before_action :authorize_admin
    layout 'admin'

    private

    def authorize_admin
      unless current_user.admin?
        redirect_to root_path, alert: "Vous n'êtes pas autorisé à accéder à cette page."
      end
    end
  end
end 