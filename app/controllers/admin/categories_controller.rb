class Admin::CategoriesController < ApplicationController

  layout 'admin'

  before_filter :authenticate_admin

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(params[:category].permit(:name, :description))
    if @category.save
      redirect_to new_admin_category_path, notice: 'Category was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category].permit(:name, :description))
      redirect_to admin_categories_path, notice: 'Category was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path, notice: 'Category deleted'
  end

end
