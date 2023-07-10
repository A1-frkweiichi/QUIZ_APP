class ChangeImageToChoiceImageAndAddExplanationImageToChoices < ActiveRecord::Migration[7.0]
  def change
    rename_column :choices, :image, :choice_image
    add_column :choices, :explanation_image, :string
  end
end
