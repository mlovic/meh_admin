class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :level

      t.timestamps
    end
  end
end
