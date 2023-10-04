class Article < ApplicationRecord
  # se você tem uma variável de instância @article contendo um artigo,
  # você pode recuperar todos os comentários pertencentes a esse artigo
  # como uma array usando @article.comments
  has_many :comments
  # title value deve está present
  # title value deve conter pelo menos one non-whitespace character.
  validates :title, presence: true 
  # body value deve esta present.
  # body value deve ter pelo menos 10 characters long.
  validates :body, presence: true, length: { minimum: 10 }
end
