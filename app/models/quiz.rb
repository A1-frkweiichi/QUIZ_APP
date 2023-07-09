class Quiz < ApplicationRecord
  has_many :choices, dependent: :destroy
  # Quizを親、Choiceを子とnestする。Choiceのcontentに入力がないなら、空のrecordとして登録しない。
  accepts_nested_attributes_for :choices,
                                reject_if: proc { |attributes| attributes["content"].blank? },
                                allow_destroy: true

  validates :title, presence: true
  validates :content, presence: true

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

# at_least_two_choices
# `reject`メソッドは配列から特定の条件に一致する要素を除外します。
# `marked_for_destruction?`メソッドは、その選択肢が削除される予定かどうかを確認します。
# したがって、`reject(&:marked_for_destruction?)`は削除予定の選択肢を除外した新しい配列を作ります。
# その結果の配列のサイズ（つまり削除されない選択肢の数）が2未満ならエラーを追加します。

# at_least_one_correct_choice
# 同様に、`reject(&:marked_for_destruction?)`は削除予定の選択肢を除外した新しい配列を作ります。
# `any?(&:is_correct)`は、その配列の中に正解の選択肢（`is_correct`がtrueの選択肢）が1つでもあるかを確認します。
# もし正解の選択肢が1つもなければ（つまり`any?(&:is_correct)`がfalseなら）エラーを追加します。
