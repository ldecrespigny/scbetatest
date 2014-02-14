class AddColumnsToCustomers < ActiveRecord::Migration
  def change
  	add_column :customers, :employees2, :string
    add_column :customers, :employees3, :string
    add_column :customers, :name, :string
  end
end
