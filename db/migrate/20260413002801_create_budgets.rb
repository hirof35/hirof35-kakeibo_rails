class CreateBudgets < ActiveRecord::Migration[8.0]
  def change
    create_table :budgets do |t|
      t.date :month
      t.integer :amount

      t.timestamps
    end
  end
end
