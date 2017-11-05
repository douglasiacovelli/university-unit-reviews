class Review < ApplicationRecord
  belongs_to :unit

  def period
    "#{year} - #{semester}º Semestre"
  end
end
