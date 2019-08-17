class RemoveDurationLevel < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :duration
    remove_column :courses, :level
  end
end
