class AddPriceToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :price, :integer
  end
end
