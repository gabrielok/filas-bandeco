class Restaurant < ApplicationRecord
    URL_REGEX = /uspdigital.usp.br/i
    validates :name, presence: true, length: {maximum: 30}, uniqueness: true
    validates :menu, presence: true, length: {maximum: 100}, format: {with: URL_REGEX}
    # Restaurant.create(name: "Prefeitura", website: "http://sites.usp.br/sas/restaurante-da-prefeitura/", menu: "https://uspdigital.usp.br/rucard/Jsp/cardapioSAS.jsp?codrtn=7")
    # Restaurant.create(name: "Fisica", website: "http://sites.usp.br/sas/restaurante-da-fisica/", menu: "https://uspdigital.usp.br/rucard/Jsp/cardapioSAS.jsp?codrtn=8")
    # Restaurant.create(name: "Central", website: "http://sites.usp.br/sas/restaurante-central/", menu: "https://uspdigital.usp.br/rucard/Jsp/cardapioSAS.jsp?codrtn=6")
    # Restaurant.create(name: "Quimica", website: "http://sites.usp.br/sas/restaurante-da-quimica/", menu: "https://uspdigital.usp.br/rucard/Jsp/cardapioSAS.jsp?codrtn=9")
end