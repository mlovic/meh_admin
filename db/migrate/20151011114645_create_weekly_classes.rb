class CreateWeeklyClasses < ActiveRecord::Migration
  def change
    create_table :weekly_classes do |t|
      t.time :starting_time
      t.time :ending_time
      t.integer :day_of_week
      t.references :group, index: true

      t.timestamps
    end
  end
end
