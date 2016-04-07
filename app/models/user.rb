class User < ActiveRecord::Base
  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid = auth_info.uid
      new_user.name = auth_info.info.name
      new_user.nickname = auth_info.info.nickname
      new_user.email = auth_info.info.email
      new_user.image = auth_info.info.image
      new_user.oauth_token = auth_info.credentials.token
      # new_user.oauth_secret =
    end
  end
  
  def set_service_with_user(current_user)
    @service = GithubService.new(current_user)
  end

  # def service
  #   @service
  # end
  #
  # def followers
  #   service.followers
  # end
  #
  # def starred
  #   service.starred
  # end
  #
  # def following
  #   service.following
  # end
  #
  # def orgs
  #   service.orgs.map { |org| OpenStruct.new(org) }
  # end
  #
  # def repositories
  #   service.repositories.map { |repo| OpenStruct.new(repo) }
  # end

end
