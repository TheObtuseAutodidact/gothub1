# class Repo
#   def self.service(user)
#     @service ||= GithubService.new(user).repositories
#   end
#
#   def self.all(user)
#     @repos = service.repos(user)
#   end
#
# def set_service_with_user(current_user)
#   @service = GithubService.new(current_user)
# end
#
# def service
#   @service
# end
#
# def repositories
#   service.repositories.map { |repo| OpenStruct.new(rep)}
# end
#   ###########################################################    Josh says no.
# # end
