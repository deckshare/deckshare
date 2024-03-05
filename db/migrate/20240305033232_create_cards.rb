class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards, id: :uuid do |t|
      t.references :collection, null: false, polymorphic: true, type: :uuid
      t.references :card, null: false, polymorphic: true, type: :uuid
      t.integer :quantity

      t.timestamps
    end

    add_index :cards, %i[collection_type collection_id card_type card_id], unique: true
  end
end
