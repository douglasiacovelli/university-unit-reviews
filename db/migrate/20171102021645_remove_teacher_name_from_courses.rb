class RemoveTeacherNameFromCourses < ActiveRecord::Migration[5.0]
  def change
    remove_column :courses, :teacher_name, :string
  end
end
