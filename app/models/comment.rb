class Comment < ActiveRecord::Base

  validates :message, :presence => true

  belongs_to :item

end
