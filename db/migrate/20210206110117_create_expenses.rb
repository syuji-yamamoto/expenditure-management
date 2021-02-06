class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string :expense_item, null: false
      t.integer :price, null: false
      t.text :memo
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
