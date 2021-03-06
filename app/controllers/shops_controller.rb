class ShopsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_user,     only: [:new, :create, :edit, :destroy]
  def index
    @shops = Shop.all
  end
  
  def new
    @shop = Shop.new
  end
  
  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      flash[:success] = "新規店舗が登録されました！"
      redirect_to @shop
    else
      render 'new'
    end
  end

  def show
    @shop = Shop.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(shop_id: params[:id])
  end

  def edit
    @user = current_user
    @shop = Shop.find(params[:id])
  end
  
  def update
    @shop = Shop.find(params[:id])
    if @shop.update_attributes(shop_params)
      flash[:success] = "店舗情報の更新が完了しました！"
      redirect_to @shop
    else
      render 'edit'
    end
  end
  
  def destroy
    @shop = Shop.find(params[:id]).destroy
    redirect_to root_url
    flash[:success] = "店舗の削除が完了しました"
  end
  
  def likes
    @user = current_user
    @likes = Like.where(user_id: @user.id)
    @shops = @likes.map do |like|
      like.shop
    end
  end
  
  def search
    @shops = Shop.all.search(params[:search])
    render 'search'
  end
  
  private

    def shop_params
      params.require(:shop).permit(:name, :adress, :area, :station, :tel, :business_hour,
      :holiday, :access, :map, :image)
    end
    
    # beforeアクション
    
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
  
end
