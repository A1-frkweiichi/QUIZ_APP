class AddCategoryToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzes, :category, :string, null: false
  end
end
