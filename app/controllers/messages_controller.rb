class MessagesController < ApplicationController
  def index
    @messages = Message.all # Messageレコードを全て取得して、@messages（インスタンス変数）に代入
  end

  def show
    @message = Message.find(params[:id])
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
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    
    if @message.update(message_params)
      flash[:success] = "メッセージが更新されました"
      redirect_to @message
    else
      flash.now[:danger] = "メッセージの更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    
    flash[:success] = "メッセージは削除されました"
    redirect_to root_url
  end
  
  private # Strong Parameter
  
  def message_params # newからcreateへ送られてきたフォームの内容の代入
    params.require(:message).permit(:content) 
  end
end
