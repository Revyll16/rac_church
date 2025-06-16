class Admin::BaseController < ApplicationController
  layout 'admin'
  
  # TODO: Implémenter une nouvelle solution d'authentification
  # Pour l'instant, on désactive la vérification d'admin
  # before_action :authenticate_admin!
end 