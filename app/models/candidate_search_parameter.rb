class CandidateSearchParameter < ApplicationRecord
  belongs_to :user

  validates :configuration_label,
            :title_search,
            :country,
            :search_type, 
            presence: true

  def schools_attended
    educational_background.split(', ')
  end

  def companies_worked_for
    employment_history.split(', ')
  end

  def programming_languages_proficient_in
    programming_languages.split(', ')
  end

  def web_frameworks_proficient_in 
    web_frameworks.split(', ')
  end
end
