class Choice < ApplicationRecord
  belongs_to :quiz
  has_rich_text :content
  has_rich_text :explanation
  mount_uploader :choice_image, ChoiceImageUploader
  mount_uploader :explanation_image, ChoiceImageUploader
  has_many :answers, dependent: :destroy
  default_scope { order(:id) }

  validates :content, presence: true
  validate :explanation_required_if_content_present

  private

  def explanation_required_if_content_present
    return unless content.present? && explanation.blank?

    errors.add(:explanation, "はcontentが入力されている場合、必須です")
  end
end
