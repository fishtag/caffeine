module Caffeine
  module Pages
    class PicturesController < CaffeineController
      respond_to :json, only: :create

      expose(:page, finder: :find_by_slug, model: Caffeine::Page)

      def create
        picture = page.pictures.create(image: picture_params)
        render json: {
          src: Refile.attachment_url(picture, :image)
        }
      end

      private

      def picture_params
        params.require(:picture)
      end
    end
  end
end
