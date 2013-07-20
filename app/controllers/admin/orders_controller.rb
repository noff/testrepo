class Admin::OrdersController < ApplicationController

  layout 'admin'

  before_filter :authenticate_admin

  def index
    @orders = Order.order('id DESC')
  end

end
