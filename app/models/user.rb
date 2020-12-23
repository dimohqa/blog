class User < ApplicationRecord
  enum role: {admin: 0, user: 1, moderator: 2}

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
end
