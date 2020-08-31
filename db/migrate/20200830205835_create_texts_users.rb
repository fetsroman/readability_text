class CreateTextsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :texts_users do |t|
      t.references :text, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
