class AddExplanationToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzes, :explanation, :text, null: false
    add_column :quizzes, :explanation_image, :string
    rename_column :quizzes, :image, :quiz_image
  end
end
