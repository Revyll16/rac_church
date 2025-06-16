module Admin
  class DashboardController < ApplicationController
    before_action :require_login
    before_action :require_admin
    layout 'admin'

    def index
      # Statistiques pour le tableau de bord
      @total_users = User.count
      @total_sermons = Sermon.count
      @total_events = Event.count
      @total_groups = Group.count
    end
  end
end 