class OrdersController < ApplicationController

  before_filter :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def create

  #  Найти все товары из корзины
    cart = ItemUser.where(user_id: current_user.id)
  #  cart = current_user.item_users

  #  Создать заказ
    new_order = Order.new
    new_order.user_id = current_user.id
    new_order.save

    # Тут будет расчитана цена заказа
    total = 0

  #  Поместить товары из корзины в заказ
    cart.each do |element|

      # Создать новую запись
      new_item_order = ItemOrder.new

      # Поместить в нее данные из элемента корзины
      new_item_order.order_id = new_order.id
      new_item_order.item_id = element.item_id
      new_item_order.quantity = element.quantity
      new_item_order.price = element.item.price

      # Сохранить в БД
      new_item_order.save

      # Добавляем стоимость товара к полной стоимости заказа
      total = total + new_item_order.price * new_item_order.quantity

    end

    # Сохраняем в БД полную стоимость заказа
    new_order.total = total
    new_order.save

  #  Удалить товары из корзины
    cart.destroy_all

  #  Перейти на список заказов
    redirect_to orders_path

  end

end
