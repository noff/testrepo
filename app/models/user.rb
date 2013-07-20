class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :item_users, dependent: :destroy
  has_many :orders, dependent: :destroy

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => '/assets/missing.png'

  # Возвращает полное имя пользователя в зависимости от того, заполнены
  # ли у него какие-то поля или нет.
  # @return String
  def full_name

    # Если есть и фамилия и имя, возвращаем имя + первая буква фамилии + точка
    if !first_name.blank? && !last_name.blank?
      return first_name + ' ' + last_name[0] + '.'
    end

    # Если есть только имя, возвращаем имя
    if !first_name.blank?
      return first_name
    end

    # Если есть только фамилия, возвращаем фамилия
    if !last_name.blank?
      return last_name
    end

    # Если нет ни имени ни фамилии, возвращаем кусок емейла до собаки
    email.split('@')[0]

  end

end
