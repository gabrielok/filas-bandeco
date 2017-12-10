class User < ApplicationRecord
  validates :nusp, presence: true, uniqueness: {message: "tá copiando, arrombado?"}, length: {in: 6..8}
  validates :restaurant, presence: true, inclusion: {in: 1..4, message: "Masoque comocefez isso"}
end
