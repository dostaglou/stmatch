class AddStarsToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :stars, :integer
  end
end
