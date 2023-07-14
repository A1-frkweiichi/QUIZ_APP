class ChangeExplanationInQuizzes < ActiveRecord::Migration[7.0]
  def change
    change_column_null :quizzes, :explanation, true
  end
end
