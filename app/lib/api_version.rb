class ApiVersion
  attr_reader :version, :default

  def initialize(version, default = false)
    @version = version 
    @default = default
  end

  def matches?(request)
    headers = request.headers 
    accept = headers[:accept]
    accept&.include?("application/vnd.irecruiter.#{version}+json") || default
  end
end