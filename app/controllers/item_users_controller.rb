class ItemUsersController < ApplicationController

  # GET
  def index
    @item_users = ItemUser.where(user_id: current_user.id)
  end

  # POST
  # Создаем [запись в корзине] и [предлагаем пользователю оформить заказ или вернуться к товару]
  def create
    @item_user = ItemUser.new
    @item_user.user_id = current_user.id
    @item_user.item_id = params[:item_id]
    @item_user.save
  end

  # DELETE
  def destroy
    cart_element = ItemUser.find params[:id]
    cart_element.destroy
    redirect_to item_users_path, notice: 'Item removed from your cart'
  end

end
