class User < ApplicationRecord
  validates :nusp, presence: true, uniqueness: true
end
