class Choice < ApplicationRecord
  belongs_to :quiz

  default_scope { order(:id) }
end
