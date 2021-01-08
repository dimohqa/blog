class User < ApplicationRecord
  enum role: { admin: 0, user: 1, moderator: 2 }

  has_many :posts, dependent: :destroy
  has_many :drafts, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
