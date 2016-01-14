class AddTypeColumnToStudents < ActiveRecord::Migration
  def change
    add_column :students, :type, :string
    add_index  :students, :type
  end
end
