class LikesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @shop = Shop.find(params[:shop_id])
    unless @shop.iine?(current_user)
      @shop.iine(current_user)
      redirect_to request.referrer || root_url
      flash[:success] = "お気に入りに登録しました！"
    end
  end

  def destroy
    @shop = Like.find(params[:id]).shop
    if @shop.iine?(current_user)
      @shop.uniine(current_user)
      redirect_to request.referrer || root_url
      flash[:success] = "お気に入り登録を解除しました！"
    end
  end
  
  private
  
  # beforeアクション
  
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end
  
end