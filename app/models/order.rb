class Order < ActiveRecord::Base
  belongs_to :user
  has_many :item_orders, dependent: :destroy


  def mark_paid
    update_attribute :paid, true
  end

end
