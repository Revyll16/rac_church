module Admin
  class EventsController < Admin::BaseController
    before_action :set_event, only: [:show, :edit, :update, :destroy]

    def index
      @events = Event.order(date: :desc, start_time: :desc)
    end

    def show
    end

    def new
      @event = Event.new
    end

    def create
      @event = Event.new(event_params)
      if @event.save
        redirect_to admin_event_path(@event), notice: 'Événement créé avec succès.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @event.update(event_params)
        redirect_to admin_event_path(@event), notice: 'Événement mis à jour avec succès.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @event.destroy
      redirect_to admin_events_path, notice: 'Événement supprimé avec succès.'
    end

    private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :description, :date, :start_time, :end_time, :image)
    end
  end
end 