class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]
  
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.shop_id = params[:shop_id]
    if @comment.save
      flash[:success] = "コメントが投稿されました。"
      redirect_to request.referrer || root_url
    else
      flash[:danger] = "投稿に失敗しました。"
      redirect_to request.referrer || root_url
    end
  end
  
  def destroy
    @comment = current_user.comments.find_by(id: params[:id])
    @comment.destroy
    flash[:success] = "コメントを削除しました。"
    redirect_to request.referrer || root_url
  end
  
  private
  
    def comment_params
      params.require(:comment).permit(:content)
    end
    
    # beforeアクション
    
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end
    
    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end
    
end
