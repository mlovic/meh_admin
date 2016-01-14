class ChangeTimeColumnNames < ActiveRecord::Migration
  def change
    rename_column :weekly_classes, :starting_time, :starts_at
    rename_column :weekly_classes, :ending_time,   :ends_at
  end
end
