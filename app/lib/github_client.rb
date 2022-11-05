class GithubClient
  BASE_URI = 'https://api.github.com'

  attr_accessor :base_uri,
                :name

  def initialize(base_uri: BASE_URI, params: {})
    @base_uri = base_uri
  end

  def get_user(name:)
    uri = URI("#{BASE_URI}/users/#{name}")
    JSON.parse(Net::HTTP.get(uri))
  end

  def get_followers_of_user(name:)
    uri = URI("#{BASE_URI}/users/#{name}/followers")
    JSON.parse(Net::HTTP.get(uri))
  end

  def get_repos_of_user(name:)
    uri = URI("#{BASE_URI}/users/#{name}/repos")
    JSON.parse(Net::HTTP.get(uri))
  end

  def get_repo_details_of_user(name:, repo:)
    uri = URI("#{BASE_URI}/repos/#{name}/#{repo}")
    JSON.parse(Net::HTTP.get(uri))
  end

  def get_commits_of_user_for_a_repo(name:, repo:)
    uri = URI("#{BASE_URI}/repos/#{name}/#{repo}/commits")
    JSON.parse(Net::HTTP.get(uri))
  end

  def get_commit_details_of_user_for_repo(name:, repo:, sha:)
    uri = URI("#{BASE_URI}/repos/#{name}/#{repo}/commits/#{sha}")
    JSON.parse(Net::HTTP.get(uri))
  end
end
