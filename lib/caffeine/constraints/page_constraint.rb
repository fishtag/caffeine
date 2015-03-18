module Caffeine
  class PageConstraint
    REFILE_ATTACHMENTS_PATH_REGEX = /attachments\/.*/
    RAILS_INFO_PATH_REGEX = /rails.*/

    def self.matches?(request)
      REFILE_ATTACHMENTS_PATH_REGEX.match(request.params[:page_id]).blank? &&
        RAILS_INFO_PATH_REGEX.match(request.params[:page_id]).blank?
    end
  end
end
