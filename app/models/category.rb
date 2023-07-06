class Category < ApplicationRecord
  has_many :quizzes
  validates :name, inclusion: { in: %w(HTML CSS JS Ruby Rails) }
end
