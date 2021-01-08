class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :restrict_with_exception
  validates :title, presence: true, length: { minimum: 4 }
end
