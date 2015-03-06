module Caffeine
  module Admin
    class PagesController < Admin::ApplicationController
      respond_to :html
      respond_to :js, only: :update

      expose(:pages)
      expose(:page, attributes: :page_params, finder: :find_by_slug, model: Caffeine::Page)

      def index
        self.pages = Caffeine::Page.roots_and_descendants_preordered.decorate
      end

      def show
        redirect_to edit_admin_page_path(id: page.slug)
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
        params.require(:page).permit(:main, :title, :slug,
                                     :content, :summary,
                                     :parent_id, :position, :tag_list)
      end
    end
  end
end
