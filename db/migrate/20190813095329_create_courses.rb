class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :level
      t.string :duration
      t.text :description
      t.references :user_id, foreign_key: true

      t.timestamps
    end
  end
end
