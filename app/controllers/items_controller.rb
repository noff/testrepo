# coding: UTF-8
class ItemsController < ApplicationController

  # GET: Список товаров
  def index
    @items = Item.all
  end

  # GET: Просмотр
  def show
    @item = Item.find params[:id]
    @comment = Comment.new item_id: @item.id
  end

end
