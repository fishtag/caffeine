module Caffeine
  module Admin
    class PagesController < Admin::ApplicationController
      respond_to :html, :json
      respond_to :js, only: :update

      expose(:page, attributes: :page_params, finder: :find_by_slug, model: Caffeine::Page)

      def index
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

      def test_response
        respond_with do |format|
            msg = { status: :ok, message: 'Success!' }
            format.json  { render json: msg }
        end
      end

      private

      def page_params
        params.require(:page).permit(Caffeine::Page.permitted_attributes)
      end
    end
  end
end
