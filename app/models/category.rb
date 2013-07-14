class Category < ActiveRecord::Base
  validates :name, :description, presence: true

  has_many :items, dependent: :nullify



end
