class Quiz < ApplicationRecord
  has_many :choices, dependent: :destroy
  # Quizを親、Choiceを子とnestする。# Choiceのcontentが空白なら新しいrecord作らない
  accepts_nested_attributes_for :choices,
                                reject_if: proc { |attributes| attributes["content"].blank? },
                                allow_destroy: true

  validates :title, presence: true
  validates :content, presence: true

  validate :at_least_two_choices
  validate :at_least_one_correct_choice

  private

  # 選択肢が2つ未満なら警告
  def at_least_two_choices
    return unless choices.size < 2

    errors.add(:choices, :at_least_two)
  end

  # 正解が1つもないなら警告
  def at_least_one_correct_choice
    return if choices.any?(&:is_correct)

    errors.add(:choices, :at_least_one_correct)
  end
end
