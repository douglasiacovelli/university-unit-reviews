class CreateUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :units do |t|
      t.string :title
      t.references :course, foreign_key: true
      t.string :teachers_name
    end
  end
end
