class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  
  def index
    @pagy, @messages = pagy(Message.order(id: :desc), items: 25) # Messageレコードを全て取得して、@messages（インスタンス変数）に代入
  end

  def show
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    
    if @message.save
      flash[:success] = "メッセージが正常に投稿されました"
      redirect_to @message
    else
      flash.now[:danger] = "メッセージの投稿に失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
    if @message.update(message_params)
      flash[:success] = "メッセージが更新されました"
      redirect_to @message
    else
      flash.now[:danger] = "メッセージの更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @message.destroy
    
    flash[:success] = "メッセージは削除されました"
    redirect_to root_url
  end
  
  private # Strong Parameter
  
  def set_message
    @message = Message.find(params[:id])
  end
  
  def message_params # newからcreateへ送られてきたフォームの内容の代入
    params.require(:message).permit(:content, :title) 
  end
end
