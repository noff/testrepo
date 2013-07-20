class Admin::UsersController < ApplicationController

  layout 'admin'

  before_filter :authenticate_admin

  def index
    @users = User.order('id DESC')
  end

end
