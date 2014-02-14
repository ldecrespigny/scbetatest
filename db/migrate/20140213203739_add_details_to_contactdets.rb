class AddDetailsToContactdets < ActiveRecord::Migration
  def change
    add_column :contactdets, :cell, :sting
    add_column :contactdets, :contactemail, :string
    add_column :contactdets, :employees, :string
    add_column :contactdets, :function, :string
  end
end
