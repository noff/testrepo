class ProfileController < ApplicationController

  before_filter :authenticate_user!

  # GET: Просмотр пользователя
  def show
    # Тут ничего не делаем, используем current_user
  end

  # GET: форма редактирования пользователя
  def edit
    # Тут ничего не делаем, используем current_user
  end

  # PUT: сохранение измененных данных пользователя
  def save
    if current_user.update_attributes params[:user].permit(:email, :first_name, :last_name, :avatar)
      redirect_to profile_show_path, notice: 'Saved'
    else
      render 'edit'
    end
  end

end
