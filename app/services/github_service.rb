class GithubService
  attr_reader :connection, :user

  def initialize(user)
    @user = user
    @connection = Faraday.new("https://api.github.com")
    # connection.params['access_token'] = user.oauth_token
  end

  def followers
    parse(connection.get("users/#{@user.nickname}/followers?access_token=#{@user.oauth_token}")) # no auth necessary
  end

  def starred
    parse(connection.get("users/#{@user.nickname}/starred?access_token=#{@user.oauth_token}")) # no auth necessary. can #to_hash.count
  end

  def following
    parse(connection.get("users/#{@user.nickname}/following?access_token=#{@user.oauth_token}")) # requires authentication
  end

  def repositories
    parse(connection.get("user/repos?access_token=#{@user.oauth_token}")) # requires authentication
  end

  def orgs
    parse(connection.get("users/#{@user.nickname}/orgs?access_token=#{@user.oauth_token}")) # requires authentication
  end

  private

  def parse(response)
    JSON.parse(response.body)
  end
end
