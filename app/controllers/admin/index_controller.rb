class Admin::IndexController < ApplicationController

  layout 'admin'

  before_filter :authenticate_admin

  def index
  end

end
