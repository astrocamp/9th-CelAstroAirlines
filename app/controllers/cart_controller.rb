class CartController < ApplicationController

  before_action :if_not_login

  # 給 ticket 頁面使用, path: add_cart_path 加入購物車
  def add
    current_cart.add_item(params[:id]) # current_cart 定義在 CartHelper
    session[:cart2022] = current_cart.serialize

    redirect_to cart_path, notice: "已加入購物車"
  end

  def show
    # render html: current_cart.items # 空值,應該是票沒被加入成功的關係
  end

  def destroy
    session[:cart2022] = nil
    redirect_to tickets_path, notice: "購物車已清空"
  end


  private
  def if_not_login
    if !current_user
      flash[:notice] = "您尚未登入"
      redirect_to root_path
    end
  end
end
