class ApplicationController < ActionController::Base
  before_action :set_layout

  private

  def set_layout
    # Pour l'instant, on utilise toujours le layout public
    # TODO: Implémenter une nouvelle solution d'authentification
    self.class.layout 'public'
  end
end
