class CreateUserCards < ActiveRecord::Migration[7.1]
  def change
    create_table :user_cards, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :card, null: false, polymorphic: true, type: :uuid
      t.integer :quantity

      t.timestamps
    end

    add_index :user_cards, %i[user_id card_type card_id], unique: true
  end
end
