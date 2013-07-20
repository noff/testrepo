# coding: UTF-8
class ItemsController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]

  # GET: Список товаров
  def index
    @items = Item.all
  end

  # GET: Форма создания
  def new
    @item = Item.new
  end

  # POST: Процесс создания
  def create
    @item = Item.new(params[:item].permit(:name, :description, :price, :category_id, :photo))
    if @item.save
      redirect_to items_path, notice: 'Item was successfully created.'
    else
      render action: "new"
    end
  end

  # GET: Форма редактирования
  def edit
    @item = Item.find params[:id]
  end

  # PUT: Процесс обновления
  def update
    @item = Item.find(params[:id])
    data = params[:item].permit(:name, :description, :price, :category_id, :photo)
    success = @item.update_attributes data
    if success
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render action: "edit"
    end
  end

  # GET: Просмотр
  def show
    @item = Item.find params[:id]
    @comment = Comment.new item_id: @item.id
  end

  # DELETE: Удаление
  def destroy
    item = Item.find params[:id] # Найти товар по его ID
    item.destroy # Уничтожить
    redirect_to items_path, notice: 'Item deleted' # Вернуться на список товаров
  end

end
