class ItemUsersController < ApplicationController

  before_filter :authenticate_user!

  # GET
  def index
    @item_users = ItemUser.where(user_id: current_user.id)
  end

  # POST
  # Создаем [запись в корзине] и [предлагаем пользователю оформить заказ или вернуться к товару]
  def create

    # Пытаюсь найти в корзине указанный товар для текущего пользователя.
    @item_user = ItemUser.where(user_id: current_user.id).where(item_id: params[:item_id]).first

    if @item_user
      # Если есть, то увеличиваю счетчик существующей записи

      @item_user.quantity = @item_user.quantity + 1
      @item_user.save

    else

      # Если нету такого, то создаю
      @item_user = ItemUser.new
      @item_user.user_id = current_user.id
      @item_user.item_id = params[:item_id]
      @item_user.save

    end

    # Показываю вьюху

  end

  # DELETE
  def destroy
    id = params[:id]
    cart_element = ItemUser.find(id)
    if cart_element.user_id == current_user.id
      if cart_element.quantity > 1
        cart_element.quantity = cart_element.quantity - 1
        cart_element.save
      else
        cart_element.destroy
      end
    end
    redirect_to item_users_path, notice: 'Item removed from your cart'
  end

end
