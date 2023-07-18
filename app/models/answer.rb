class Answer < ApplicationRecord
  belongs_to :quiz
  belongs_to :choice
  belongs_to :user
end
