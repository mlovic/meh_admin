class AddScheduleToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :schedule, :text
  end
end
