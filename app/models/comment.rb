class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validate :opinion, presence: true
  
end
