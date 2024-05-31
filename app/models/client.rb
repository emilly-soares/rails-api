class Client < ApplicationRecord
  validates :nome, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :sobrenome, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :endereco, presence: true, length: { minimum: 5 }
end
