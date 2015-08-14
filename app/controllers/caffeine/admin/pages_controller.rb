module Caffeine
  module Admin
    class PagesController < Admin::ApplicationController
      respond_to :html
      respond_to :js, only: :update
      respond_to :json, only: :search

      expose(:found_pages, strategy: Caffeine::PagesSearchStrategy, model: Caffeine::Page)
      expose(:page, attributes: :page_params, finder: :find_by_slug, model: Caffeine::Page)

      def index
      end

      def show
        redirect_to edit_admin_page_path(id: page.slug)
      end

      def new
        self.page = page.decorate
      end

      def create
        page.save
        respond_with :admin, page
      end

      def edit
        self.page = page.decorate
      end

      def update
        page.save
        respond_with :admin, page
      end

      def destroy
        return unless page.main?

        page.destroy
        respond_with :admin, page
      end

      def search
        respond_with do |format|
          format.json  { found_pages }
        end
      end

      private

      def page_params
        params.require(:page).permit(Caffeine::Page.permitted_attributes)
      end
    end
  end
end
