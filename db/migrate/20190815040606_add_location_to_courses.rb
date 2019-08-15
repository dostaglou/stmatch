class AddLocationToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :location, :string
  end
end
