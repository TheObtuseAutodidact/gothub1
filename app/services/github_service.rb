class GithubService
  attr_reader :connection

  def initialize(user)
    @user = user
    @connection = Faraday.new("https://api.github.com")
  end

end
