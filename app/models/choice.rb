class Choice < ApplicationRecord
  belongs_to :quiz
  default_scope { order(:id) }

  validates :content, presence: true
  validate :explanation_required_if_content_present

  private

  def explanation_required_if_content_present
    return unless content.present? && explanation.blank?

    errors.add(:explanation, "はcontentが入力されている場合、必須です")
  end
end
