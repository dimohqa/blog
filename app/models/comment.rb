class Comment < ApplicationRecord
  belongs_to :post

  validates :username, presence: true
end
