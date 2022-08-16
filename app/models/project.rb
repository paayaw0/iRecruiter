class Project < ApplicationRecord
  belongs_to :candidate

  validates :title, 
            :description,
            :url, presence: true
end
