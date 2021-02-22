class AddRatingToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :rating, :integer
  end
end
