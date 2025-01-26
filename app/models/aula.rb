class Aula < ApplicationRecord
  belongs_to :curso
  
  validates :titulo, :video_url, presence: true
end