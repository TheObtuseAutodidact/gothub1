class GithubUser 

  def initialize(current_user)
    set_service_with_user(current_user)
  end

  def set_service_with_user(current_user)
    @service = GithubService.new(current_user)
  end

  def service
    @service
  end

  def followers
    service.followers
  end

  def starred
    service.starred
  end

  def following
    service.following
  end

  def orgs
    service.orgs.map { |org| OpenStruct.new(org) }
  end

  def repositories
    service.repositories.map { |repo| OpenStruct.new(repo) }
  end
end
