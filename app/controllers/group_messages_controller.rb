class GroupMessagesController < ApplicationController
  before_action :require_login
  before_action :set_group
  before_action :authorize_member!

  def index
    @messages = @group.group_messages.includes(:user, file_attachment: :blob).order(created_at: :asc)
    @message = @group.group_messages.new
  end

  def create
    @message = @group.group_messages.new(message_params)
    @message.user = current_user
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_group_messages_path(@group) }
        format.turbo_stream
      end
    else
      @messages = @group.group_messages.includes(:user, file_attachment: :blob).order(created_at: :asc)
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def message_params
    params.require(:group_message).permit(:content, :file)
  end

  def authorize_member!
    unless @group.members.include?(current_user)
      redirect_to groups_path, alert: "Vous n'avez pas accès à ce groupe de discussion."
    end
  end
end 