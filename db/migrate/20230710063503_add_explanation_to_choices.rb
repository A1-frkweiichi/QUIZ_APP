class AddExplanationToChoices < ActiveRecord::Migration[7.0]
  def change
    add_column :choices, :explanation, :text, null: false
  end
end
