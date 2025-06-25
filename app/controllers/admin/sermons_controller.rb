module Admin
  class SermonsController < Admin::BaseController
    before_action :set_sermon, only: [:show, :edit, :update, :destroy]

    def index
      @sermons = Sermon.order(date: :desc)
    end

    def show
    end

    def new
      @sermon = Sermon.new
    end

    def create
      @sermon = Sermon.new(sermon_params)
      if @sermon.save
        redirect_to admin_sermon_path(@sermon), notice: 'Sermon créé avec succès.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @sermon.update(sermon_params)
        redirect_to admin_sermon_path(@sermon), notice: 'Sermon mis à jour avec succès.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @sermon.destroy
      redirect_to admin_sermons_path, notice: 'Sermon supprimé avec succès.'
    end

    private

    def set_sermon
      @sermon = Sermon.find(params[:id])
    end

    def sermon_params
      params.require(:sermon).permit(:title, :speaker, :date, :audio, :video, :video_url, :description, :scripture_references)
    end
  end
end 