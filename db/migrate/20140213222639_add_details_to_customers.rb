class AddDetailsToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :email, :string
    add_column :customers, :employees, :string
    add_column :customers, :function, :string
  end
end
