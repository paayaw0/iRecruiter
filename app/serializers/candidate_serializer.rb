class CandidateSerializer
  include JSONAPI::Serializer
  
  attributes :name, 
             :email, 
             :employment_status, 
             :work_mode, 
             :linkedin_profile, 
             :personal_website, 
             :current_location, 
             :hiring_status, 
             :current_employer, 
             :sex, 
             :years_of_experience, 
             :experience_level  
             
# has_many :tracking_recruiters, through: :candidate_trackings, source: :user, record_type: :user
  
# this works same as above commmented. comments kept for future reference
  has_many :tracking_recruiters, serializer: UserSerializer
end
