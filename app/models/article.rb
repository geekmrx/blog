class Article < ApplicationRecord
  # title value deve está present
  # title value deve conter pelo menos one non-whitespace character.
  validates :title, presence: true 
  # body value deve esta present.
  # body value deve ter pelo menos 10 characters long.
  validates :body, presence: true, length: { minimum: 10 }
end
