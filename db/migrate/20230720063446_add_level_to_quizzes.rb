class AddLevelToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzes, :level, :string, null: false
  end
end
