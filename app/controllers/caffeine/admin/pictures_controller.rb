module Caffeine
  module Admin
    class PicturesController < CaffeineController
      respond_to :json, only: :create

      expose(:page, finder: :find_by_slug, model: Caffeine::Page)

      def create
        picture = Caffeine::Picture.create(image: picture_params)
        render json: {
          id: picture.id,
          src: Refile.attachment_url(picture, :image)
        }
      end

      def destroy
      end

      private

      def picture_params
        params.require(:files)
      end
    end
  end
end
