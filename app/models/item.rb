class Item < ActiveRecord::Base
  validates :name, :description, :price, :presence => true
  validates_length_of :name, :minimum => 2
  validates :price, :numericality => {
      :greater_than => 0,
      :only_integer => true
  }

  belongs_to :category
  has_many :comments, :dependent => :nullify
  has_many :item_users, dependent: :destroy



  def self.sss(s)
    r = s * s + 3
    return r
  end



end
