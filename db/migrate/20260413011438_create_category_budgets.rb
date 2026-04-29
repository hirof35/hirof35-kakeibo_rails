class CreateCategoryBudgets < ActiveRecord::Migration[8.0]
  def change
    create_table :category_budgets do |t|
      t.string :category
      t.integer :amount

      t.timestamps
    end
  end
end
