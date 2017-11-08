class Restaurant < ApplicationRecord
    URL_REGEX = /\Asites.usp.br/i
    validates(:name, presence: true, length: {maximum: 30}, uniqueness: true)
    validates(:website, presence: true, length: {maximum: 100}, format: {with: URL_REGEX})
end