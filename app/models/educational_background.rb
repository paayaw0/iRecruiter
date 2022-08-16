class EducationalBackground < ApplicationRecord
  belongs_to :candidate

  validates :name_of_school,
            :qualification,
            :start_date,
            :end_date,
            :courses, presence: true
end
