class Employer < ApplicationRecord
  belongs_to :candidate

  validates :name,
            :industry,
            :years_worked,
            :job_title, presence: true
end
