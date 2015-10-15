module Caffeine
  module Admin
    class PicturesController < CaffeineController
      # expose(:page, finder: :find_by_slug, model: Caffeine::Page)

      def create
        picture = Caffeine::Picture.create(image: picture_params)
        render json: {
          files: [{
                id: picture.id,
                url: Refile.attachment_url(picture, :image),
                delete_url: admin_picture_path(picture.id)
              }]
        }
      end

      def destroy
        @picture = Picture.find(params[:id])
        @picture.destroy
        render json: true
      end

      private

      def picture_params
        params.require(:picture)
      end
    end
  end
end
