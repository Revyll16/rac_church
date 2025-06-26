module Admin
  class GroupsController < Admin::BaseController
    before_action :set_group, only: [:show, :edit, :update, :destroy]

    def index
      @groups = Group.all.order(created_at: :desc)
    end

    def show
    end

    def new
      @group = Group.new
    end

    def create
      @group = Group.new(group_params)
      if @group.save
        @group.member_ids = params[:group][:member_ids] if params[:group][:member_ids]
        redirect_to admin_group_path(@group), notice: 'Groupe créé avec succès.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @group.update(group_params)
        @group.member_ids = params[:group][:member_ids] if params[:group][:member_ids]
        redirect_to admin_group_path(@group), notice: 'Groupe mis à jour avec succès.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @group.destroy
      redirect_to admin_groups_path, notice: 'Groupe supprimé avec succès.'
    end

    private

    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, :description, :image, member_ids: [])
    end
  end
end 