class User < ApplicationRecord
  enum role: { admin: 0, user: 1, moderator: 2 }

  has_many :posts
  has_many :drafts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
