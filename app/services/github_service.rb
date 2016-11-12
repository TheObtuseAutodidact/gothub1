class GithubService
  attr_reader :connection, :user

  def initialize(user)
    @user = user
    @connection = Faraday.new("https://api.github.com")
    connection.params['access_token'] = user.oauth_token
    
  end

  def followers
    parse(connection.get("users/#{@user.nickname}/followers")) # no auth necessary
  end

  def starred
    parse(connection.get("users/#{@user.nickname}/starred")) # no auth necessary. can #to_hash.count
  end

  def following
    parse(connection.get("users/#{@user.nickname}/following")) # requires authentication
  end

  def repositories
    parse(connection.get("user/repos")) # requires authentication
  end

  def orgs
    parse(connection.get("users/#{@user.nickname}/orgs"))  #?access_token=#{@user.oauth_token}")) # requires authentication
  end                                                      # connection.params['access_token'] = user.oauth_token
                                                           # stands in for the explicit params as string

  private

  def parse(response)
    JSON.parse(response.body)
  end
end
