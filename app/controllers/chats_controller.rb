class ChatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chats = policy_scope(Chat).involving(current_user).order(created_at: :desc)
  end

  def show
    @chat = Chat.find(params[:id])
    @other_user = current_user == @chat.sender ? @chat.recipient : @chat.sender
    @messages = @chat.messages.order(created_at: :asc).last(20)
    @message = Message.new
    authorize @chat
  end

  def create
    @chat = Chat.between(params[:sender_id], params[:recipient_id]).first_or_create!(chat_params)

    redirect_to @chat
  end

  private

  def chat_params
    params.permit(:sender_id, :recipient_id)
  end
end
