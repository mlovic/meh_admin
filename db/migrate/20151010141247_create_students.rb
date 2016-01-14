class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.date :date_of_birth
      t.string :phone
      t.string :level
      t.string :notes

      t.timestamps
    end
  end
end
