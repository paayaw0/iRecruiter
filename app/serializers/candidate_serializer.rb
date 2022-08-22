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
end
