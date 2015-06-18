module Caffeine
  class PagesController < CaffeineController
    before_action :redirect_main_page, only: :show
    before_action :redirect_page_to_proper_path, only: :show

    expose(:pages)
    expose(:page, strategy: PageStrategy)

    def show
    end

    protected

    def redirect_main_page
      redirect_to root_path, status: :moved_permanently if page.main?
    end

    # This callback redirects page to a proper path.
    # For instance we have parent page and 2 child pages for it
    # Child 1 is set to be served only by short path -> '/child1'
    # Child 2 is set to be served only by full path  -> '/parent/child2'
    #
    # This callback check behavior for current page and redirects if needed.
    # So it will redirect:
    #   '/parent/child1'  to '/child1'
    #   '/child2'         to '/parent/child2'
    #
    # And will not redirect '/child1' and '/parent/child2'
    def redirect_page_to_proper_path
      if request.path != page_path_for(page)
        redirect_to page_path_for(page), status: :moved_permanently
      end
    end
  end
end
