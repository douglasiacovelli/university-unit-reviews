class Unit < ApplicationRecord
  belongs_to :course
  has_many :reviews

  def title_with_course
      "#{course.title} - #{title}"
  end

end
