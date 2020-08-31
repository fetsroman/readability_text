class CreateTexts < ActiveRecord::Migration[6.0]
  def change
    create_table :texts do |t|
      t.text :text
      t.integer :readability

      t.timestamps
    end
  end
end
