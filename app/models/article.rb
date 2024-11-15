class Article < ApplicationRecord
  has_rich_text :content
  CATEGORIES = ['Front-end', 'Back-end', 'Full-stack', 'Desenvolvimento Mobile', 'Desenvolvimento Web', 'Ciência de Dados']
  
  belongs_to :user
  validates :category, presence: true, inclusion: { in: CATEGORIES }
end
