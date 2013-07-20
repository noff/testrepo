class Admin::ItemsController < ApplicationController

  layout 'admin'

  before_filter :authenticate_admin

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
      redirect_to admin_items_path, notice: 'Item was successfully created.'
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
      redirect_to admin_items_path, notice: 'Item was successfully updated.'
    else
      render action: "edit"
    end
  end


  # DELETE: Удаление
  def destroy
    item = Item.find params[:id] # Найти товар по его ID
    item.destroy # Уничтожить
    redirect_to admin_items_path, notice: 'Item deleted' # Вернуться на список товаров
  end

end
