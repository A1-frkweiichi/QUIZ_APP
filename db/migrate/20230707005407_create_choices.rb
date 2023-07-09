class CreateChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :choices do |t|
      t.references :quiz, null: false, foreign_key: true
      t.text :content
      t.string :image
      t.boolean :is_correct

      t.timestamps
    end
  end
end
