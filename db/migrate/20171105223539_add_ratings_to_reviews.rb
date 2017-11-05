class AddRatingsToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :rating_relevance, :integer
    add_column :reviews, :rating_teaching, :integer
    add_column :reviews, :rating_exam, :integer
    add_column :reviews, :rating_worth_it, :boolean
    add_column :reviews, :rating_difficulty, :integer
  end
end
