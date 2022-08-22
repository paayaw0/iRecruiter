class UserSerializer
  include JSONAPI::Serializer
  attributes :username, :email, :recruiter

  has_many :tracked_candidates, serializer: CandidateSerializer
end
