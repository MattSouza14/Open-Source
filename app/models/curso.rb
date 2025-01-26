class Curso < ApplicationRecord
  has_many :aulas, dependent: :destroy
  
  validates :nome, :descricao, presence: true
end