class AddMoreColumnsToCandidateSearchParameters < ActiveRecord::Migration[7.0]
  def change
    add_column :candidate_search_parameters, :title_search, :string 
    add_column :candidate_search_parameters, :keyword_search, :string
    add_column :candidate_search_parameters, :level_of_skill, :string
    add_column :candidate_search_parameters, :configuration_label, :string
    add_column :candidate_search_parameters, :search_type, :string 
  end
end
