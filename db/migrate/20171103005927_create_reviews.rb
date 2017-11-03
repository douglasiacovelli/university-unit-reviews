class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :content
      t.references :unit, foreign_key: true
      t.integer :rating
      t.integer :year
      t.integer :semester
    end
  end
end
