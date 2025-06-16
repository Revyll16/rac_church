module Admin
  class DashboardController < Admin::BaseController
    def index
      # Statistiques de base pour le tableau de bord
      @total_members = User.count
      @total_events = Event.count
      @total_sermons = Sermon.count
    end
  end
end 