class Client < ApplicationRecord
  validates :nome, presence: true
  validates :sobrenome, presence: true
  validates :endereco, presence: true
end
