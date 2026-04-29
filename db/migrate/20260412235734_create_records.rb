class CreateRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :records do |t|
      t.date :date
      t.integer :amount
      t.string :category
      t.text :memo

      t.timestamps
    end
  end
end
