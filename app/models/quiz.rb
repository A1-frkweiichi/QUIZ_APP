class Quiz < ApplicationRecord
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices, allow_destroy: true, reject_if: :all_blank, limit: 4

  validates :title, presence: true
  validates :content, presence: true

  validate :at_least_two_choices
  validate :at_least_one_correct_choice

  private

  def at_least_two_choices
    if choices.size < 2
      errors.add(:choices, "should be at least 2")
    end
  end

  def at_least_one_correct_choice
    unless choices.any?(&:is_correct)
      errors.add(:choices, "At least one choice should be correct")
    end
  end
end
