class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.string :expense_item, null: false
      t.integer :price, null: false
      t.text :memo, null: false
      t.timestamps
    end
  end
end
