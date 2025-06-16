module Member
  class DashboardController < Member::BaseController
    def index
      # Informations pertinentes pour les membres
      @upcoming_events = Event.upcoming.limit(5)
      @recent_sermons = Sermon.recent.limit(5)
    end
  end
end 