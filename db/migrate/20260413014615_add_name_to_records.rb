class AddNameToRecords < ActiveRecord::Migration[8.0]
  def change
    add_column :records, :name, :string
  end
end
