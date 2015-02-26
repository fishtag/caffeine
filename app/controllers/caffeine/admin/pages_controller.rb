module Caffeine
  module Admin
    class PagesController < Admin::ApplicationController
      respond_to :html
      respond_to :js, only: :update

      expose(:pages) { Page.roots_and_descendants_preordered }
      expose(:page, attributes: :page_params, finder: :find_by_slug)

      def index
        self.pages = pages.decorate
      end

      def show
        redirect_to edit_admin_page_path(page)
      end

      def new
      end

      def create
        page.save
        respond_with :admin, page
      end

      def edit
      end

      def update
        page.save
        respond_with :admin, page
      end

      def destroy
        page.destroy
        respond_with :admin, page
      end

      private

      def page_params
        params.require(:page).permit(:main,
                                     :title,
                                     :content,
                                     :summary,
                                     :slug,
                                     :fix_slug,
                                     :parent_id,
                                     :position)
      end
    end
  end
end
