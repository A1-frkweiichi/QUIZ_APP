class Quiz < ApplicationRecord
  has_rich_text :content
  has_rich_text :explanation
  has_many :choices, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :choices,
                                reject_if: proc { |attributes| attributes["content"].blank? },
                                allow_destroy: true

  validates :title, presence: true
  validates :content, presence: true
  validates :explanation, presence: true

  validate :at_least_two_choices
  validate :at_least_one_correct_choice

  private

  def at_least_two_choices
    return unless choices.reject(&:marked_for_destruction?).size < 2

    errors.add(:choices, :at_least_two)
  end

  def at_least_one_correct_choice
    return if choices.reject(&:marked_for_destruction?).any?(&:is_correct)

    errors.add(:choices, :at_least_one_correct)
  end
end
