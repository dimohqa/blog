class Post < ApplicationRecord
  has_many :comments, :dependent
  validates :title, presence: true, length: { minimum: 4 }
end
