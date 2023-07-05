class CreateQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :quizzes do |t|
      t.references :category, null: false, foreign_key: true
      t.string :title
      t.text :content
      t.string :image

      t.timestamps
    end
  end
end
