class ChangeExplanationNullToChoices < ActiveRecord::Migration[7.0]
  def change
    change_column_null :choices, :explanation, true
  end
end
